import java.io.InputStream;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.HashMap;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import net.sf.jasperreports.engine.JRException;
import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.Action;
import net.sf.jasperreports.engine.JasperCompileManager;
import javax.servlet.ServletContext;
import javax.servlet.ServletOutputStream;
import net.sf.jasperreports.engine.JRResultSetDataSource;
import net.sf.jasperreports.engine.JasperRunManager;
public class GenerateReport extends Action{

public final ActionForward execute(final ActionMapping map, final ActionForm form,

final HttpServletRequest request, final HttpServletResponse response)

throws Exception{

// get connection

Connection conn = PidsUtils.getConnection(request);

JasperForm myForm = (JasperForm)form;

ResultSet rs = null;

LoggableStatement stmt = null;

stmt = new LoggableStatement(conn.createStatement(ResultSet.TYPE_SCROLL_INSENSITIVE,ResultSet.CONCUR_READ_ONLY));

try {

// generate query

//I believe using regular expressions with regexp_replace() would be preferrable but we are using 9i instead of 10g. Not supported yet.

//xml does not handle the 5 special characters &,',", with out special treatment

String query = "SELECT * " +

"FROM DATAFILE " +

"WHERE CURDATE LIKE '" + myForm.getDate() + "')";

rs = stmt.executeQuery(query);

//check to make sure result set has data

if(rs != null && rs.next()){

rs.beforeFirst();

JRResultSetDataSource rsds = new JRResultSetDataSource(rs);

//get context path

ServletContext context = this.getServlet().getServletContext();

ServletOutputStream servletOutputStream = response.getOutputStream();

response.setContentType("application/pdf");

//compile jrxml file

JasperCompileManager.compileReportToFile(context.getRealPath("/WEB-INF/classes/reports/jasper/TestTasking.jrxml"));

InputStream reportStream = getServlet().getServletConfig().getServletContext().getResourceAsStream("/WEB-INF/classes/reports/jasper/TestTasking.jasper");

//generate report

//

JasperFillManager.fillReportToFile(context.getRealPath("/WEB-INF/classes/reports/jasper/TestReport.jasper"), new HashMap(), rsds);

//view pdf file in browser window

JasperRunManager.runReportToPdfStream(reportStream, servletOutputStream, new HashMap(), rsds);

servletOutputStream.flush();

servletOutputStream.close();

System.out.println("Done!");

//redirect to jsp page---empty result set

}else{

return map.findForward("empty");

}

} catch (JRException e) {

PidsUtils.exceptionLogger(e,request);

e.printStackTrace();

}catch (SQLException sqlEx){

PidsUtils.exceptionLogger(sqlEx,request);

sqlEx.printStackTrace();

}catch(Exception ex){

PidsUtils.exceptionLogger(ex,request);

System.out.println("exception Is " + ex.toString());

} finally{

if (rs != null){

rs.close();

}

if(stmt != null){

stmt.close();

}

}

return map.findForward(null);

}
}
