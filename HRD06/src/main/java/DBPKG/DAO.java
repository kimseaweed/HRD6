package DBPKG;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class DAO {
Connection conn;
PreparedStatement pstmt;
ResultSet rs;


public static Connection getConnection() {
	Connection con = null;
	try {
	Class.forName("oracle.jdbc.OracleDriver");
		con = DriverManager.getConnection(
				"jdbc:oracle:thin:@//localhost:1521/xe",
				"C##system",
				"1234");
	} catch (ClassNotFoundException e) {
		System.out.println("접속불가");
		e.printStackTrace();
	} catch (SQLException e) {
		System.out.println("접속실패");
		e.printStackTrace();
	}
	return con;
}

public static void getClose(Connection conn, PreparedStatement pstmt, ResultSet rs) {
	try {
	if(conn!=null)conn.close();
	if(pstmt!=null) pstmt.close();
	if(rs!=null) rs.close();
		} catch (SQLException e) {
System.out.println("종료문제");
			e.printStackTrace();
		}
}

////////////

public List<DTO> getTeacher(){
	List<DTO> list = new ArrayList<>();
	try {
	conn = DAO.getConnection();
		rs = conn.prepareStatement("select teacher_code as tcode,teacher_name as tname,class_name as cname, "
				+ "'￦'||to_char(class_price,'FM999,999,999,999') as cprice, "
				+ "substr(teach_resist_date,1,4)||'년'||substr(teach_resist_date,5,2)||'월'||substr(teach_resist_date,7,2)||'일' as cdate "
				+ "from tbl_teacher_202201").executeQuery();
		if(rs.next()) {
			do{
				DTO dto = new DTO();
				dto.setTcode( rs.getString("tcode") );
				dto.setTname( rs.getString("tname") );
				dto.setCname( rs.getString("cname") );
				dto.setCprice( rs.getString("cprice") );
				dto.setCdate( rs.getString("cdate") );
				list.add(dto);				
			}while(rs.next());
		}else {
			System.out.println("getTeacher : 결과없음");
		}
	} catch (SQLException e) {
		System.out.println("getTeacher : sql 중단");
		e.printStackTrace();
	}
	return list;
}


public List<DTO> getMember(){
	List<DTO> list = new ArrayList<>();
	try {
	conn = DAO.getConnection();
		rs = conn.prepareStatement("select  substr(c.resist_month,1,4)||'년'||substr(c.resist_month,5,2)||'월' as cdate,"
				+ "c.c_no as cno,m.c_name mname,t.class_name as cname,c.class_area as carea, "
				+ "'￦'||to_char(c.tuition,'FM999,999,999,999') as cprice, m.grade "
				+ "from tbl_teacher_202201 t "
				+ "join tbl_class_202201 c on t.teacher_code = c.teacher_code "
				+ "join tbl_member_202201 m on m.c_no = c.c_no "
				+ "order by c.resist_month, c.c_no").executeQuery();
		if(rs.next()) {
			do{
				DTO dto = new DTO();
				dto.setCdate( rs.getString("cdate") );
				dto.setCno( rs.getString("cno") );
				dto.setMname( rs.getString("mname") );
				dto.setCname( rs.getString("cname") );
				dto.setCarea( rs.getString("carea") );
				dto.setCprice( rs.getString("cprice") );
				dto.setGrade( rs.getString("grade") );
				list.add(dto);				
			}while(rs.next());
		}else {
			System.out.println("getMember : 결과없음");
		}
	} catch (SQLException e) {
		System.out.println("getMember : sql 중단");
		e.printStackTrace();
	}
	return list;
}

public List<DTO> getSale(){
	List<DTO> list = new ArrayList<>();
	try {
	conn = DAO.getConnection();
		rs = conn.prepareStatement("select t.teacher_code as tcode,t.class_name as cname,"
				+ "t.teacher_name as tname, "
				+ "'￦'||to_char(sum(c.tuition),'FM999,999,999,999') as cprice "
				+ "from tbl_teacher_202201 t "
				+ "join tbl_class_202201 c on t.teacher_code = c.teacher_code "
				+ "group by t.teacher_code,t.class_name,t.teacher_name "
				+ "order by t.teacher_code").executeQuery();
		if(rs.next()) {
			do{
				DTO dto = new DTO();
				dto.setTcode( rs.getString("tcode") );
				dto.setCname( rs.getString("cname") );
				dto.setTname( rs.getString("tname") );
				dto.setCprice( rs.getString("cprice") );
				list.add(dto);				
			}while(rs.next());
		}else {
			System.out.println("getSale : 결과없음");
		}
	} catch (SQLException e) {
		System.out.println("getSale : sql 중단");
		e.printStackTrace();
	}
	return list;
}

////////////
public int setSale(DTO dto){
	try {
	conn = DAO.getConnection();
	pstmt = conn.prepareStatement("insert into tbl_class_202201 values(?,?,?,?,?)");
	pstmt.setString(1, dto.getCdate());
	pstmt.setString(2, dto.getCno());
	pstmt.setString(3, dto.getCarea());
	pstmt.setString(4, dto.getCprice());
	pstmt.setString(5, dto.getTcode());
	int result = pstmt.executeUpdate();
	if(result==1) {
		return result;
	}else {
		System.out.println("setSale : 결과가 이상함");
		return result;
	}
	} catch (Exception e) {
		System.out.println("setSale : sql 중단");
		e.printStackTrace();
	}
	return -1;
}


}
