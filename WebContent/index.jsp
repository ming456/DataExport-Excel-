<%@ page contentType="text/html; charset=GBK" language="java" import="java.sql.*,com.core.ConnDB"%>
<%
String month=request.getParameter("month");
String title="���ʱ���";
String sql="SELECT * FROM tb_wage ORDER BY wageDate desc";

if(month!=null && !month.equals("")){
  sql="SELECT * FROM tb_wage where wageDate='"+month+"' ORDER BY wageDate desc";
  title=month+title;
}
ConnDB c =new ConnDB();
System.out.println("SQL:"+sql);
ResultSet rs=c.executeQuery(sql);
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=GBK">
<title>����Excel��ӡ���ʱ���</title>
<link href="CSS/style.css" rel="stylesheet"/>
<body>
<form name="form1" method="post" action="index.jsp">
<table width="643"  border="0" align="center" cellpadding="0" cellspacing="0" class="tab_border">
  <tr>
    <td height="68" colspan="2" background="query.gif"><table width="100%" height="25" border="0" cellpadding="0" cellspacing="0">
      <tr>
        <td width="45%">&nbsp;</td>
        <td width="55%">
          <select name="month">
            <option value="2018-09">2018-09</option>
            <option value="2007-10">2007-10</option>
          </select>
          <input name="Submit" type="submit" class="btn_grey" value="��ѯ">
        </td>
      </tr>
    </table></td>
  </tr>
  <tr>
    <td width="4%">&nbsp;</td>
    <td width="96%" align="left"><table width="643" border="0" cellspacing="1" bgcolor="#000000" id="pay">
      <tr>
        <td width="37" height="27" align="center" bgcolor="#efefef">���</td>
        <td width="152" align="center" bgcolor="#efefef">Ա������</td>
        <td width="106" align="center" bgcolor="#efefef">�·�</td>
        <td width="85" align="center" bgcolor="#efefef">����</td>
        <td width="74" align="center" bgcolor="#efefef">��������</td>
        <td width="80" align="center" bgcolor="#efefef">����</td>
        <td width="87" align="center" bgcolor="#efefef">��ʳ��</td>
        <td width="87" align="center" bgcolor="#efefef">ʵ������</td>
      </tr>
      <%
  int i=1;
  String name="";
  String wageDate="";
  float award=0f;
  float basicPay=0f;
  float allowance=0f;
  float fare=0f;
  try{
    while(rs.next()){
		name=rs.getString(2);
        wageDate=rs.getString(3);
        award=rs.getFloat(4);
        basicPay=rs.getFloat(5);
        allowance=rs.getInt(6);
        fare=rs.getInt(7);
	%>
      <tr>
        <td height="25" align="center" bgcolor="#FFFFFF"><%=i%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=name%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=wageDate%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=award%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=basicPay%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=allowance%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=fare%></td>
        <td align="center" bgcolor="#FFFFFF">&nbsp;<%=basicPay+award+allowance-fare%></td>
      </tr>
      <%
   i++;
    }
  }catch(Exception e){
    System.out.println(e.getMessage());
  }
  %>
    </table>
        <p align="center"><a href="#" onClick="outExcel();">��ӡ</a></p>
<script language="javascript">
function outExcel(){
	var table=document.all.pay;		//��ȡ���
	row=table.rows.length;			//��ȡ��������
	column=table.rows(1).cells.length;	//��ȡ��������
	var excelapp=new ActiveXObject("Excel.Application");	
	excelapp.visible=true;
	objBook=excelapp.Workbooks.Add(); //����µĹ�����
	var objSheet = objBook.ActiveSheet;	//��ȡ�������

	title=objSheet.Range("D1").MergeArea;  //�ϲ���Ԫ��
	title.Cells(1,1).Value ="<%=title%>";
	title.Cells(1,1).Font.Size =16;			//�����ֵĴ�С
	for(i=1;i<row+1;i++){
		for(j=0;j<column;j++){
		  objSheet.Cells(i+1,j+1).value=table.rows(i-1).cells(j).innerHTML.replace("&nbsp;","");
		}
	}
    objBook.SaveAs("C:/payList.xls");	//�����ɵ�Excel�Զ����浽ָ��·����
	excelapp.UserControl = true;		//�Զ���ӡ
}
</script>
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr>
            <td>&nbsp;</td>
          </tr>
      </table></td>
  </tr>
</table>
 </form>
</body>
</html>
