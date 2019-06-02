package Board;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import Board.reDTO;
import pageCount.PageCount;

public class reDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public reDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	public ArrayList<reDTO> list(int start, int end){
		//String sql="select * from paging";
		//String sql="select * from paging order by num desc";
		String sql = "select B.* from(select rownum rn, A.* from"
				+ "(select * from jsp_board order by num desc)A)B where rn between ? and ?";
		ArrayList<reDTO> listDto = new ArrayList<>();
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs = ps.executeQuery();
			while(rs.next()) {
				reDTO dto = new reDTO();
				dto.setNum(rs.getInt("num"));
				dto.setId(rs.getString("id"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
				dto.setFilename(rs.getString("filename"));
				dto.setPdate(rs.getString("pdate"));
				dto.setCount(rs.getInt("count"));
				dto.setLikey(rs.getInt("likey"));
				listDto.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return listDto;
	} 
	public void insert(reDTO dto) {
		String sql="insert into jsp_board(num,id,title,content,filename,pdate,count,likey)"
								+ " values(board_num.nextval,?,?,?,?,sysdate,0,0)";
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getFilename());
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	public void count(String num) {
		String sql = "update jsp_board set count=count+1 where num="+num;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public int getTotalPage() {
		String sql = "select count(*) from jsp_board";
		int totPage=0;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) { totPage=rs.getInt(1); }
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return totPage;
	}
	public PageCount pagingNum(int start) {
		System.out.println("start : "+start);
		if(start == 0)start=1;
		PageCount pc = new PageCount();
		int pageNum=10;
		int totalPage = getTotalPage();
		int totEndPage = totalPage/pageNum + (totalPage%pageNum == 0 ?0 :1);
		int startPage = (start - 1) * pageNum + 1;
		int endPage = pageNum * start;
		pc.setTotEndPage(totEndPage);
		pc.setStartPage(startPage);
		pc.setEndPage(endPage);
		return pc;
	}
	public reDTO listView(String num){
		
		reDTO dto = new reDTO();
		String sql="select * from jsp_board where num="+num;
		 try {
			 con= DriverManager.getConnection(url,user,pwd);
			 ps = con.prepareStatement(sql);
			 rs =ps.executeQuery();
			 if(rs.next()) {
			 dto.setContent(rs.getString("content"));
			 dto.setId(rs.getString("id"));
			 dto.setTitle(rs.getString("title"));
			 dto.setFilename(rs.getString("filename"));
			 dto.setPdate(rs.getString("pdate"));
			 dto.setCount(rs.getInt("count"));
			 dto.setNum(rs.getInt("num"));
			 dto.setLikey(rs.getInt("likey"));
				
			 
			 }
		 }catch(SQLException e) {
			 e.getMessage();
		 }
		return dto;
		
	}
	public void listDelete(String md) {
		String sql = "delete from jsp_board where num="+ md;
		
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			
		} catch (SQLException e) {

			e.printStackTrace();
		}
	

	}
	public void listModify(String title, String content, int num) {
		String sql = "update jsp_board set title=?, content=? where num=?";
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setInt(3, num);

			ps.executeUpdate();
		} catch (SQLException e) {

			e.printStackTrace();
		}

	}
	
	public void like(String num) {
		String sql = "update jsp_board set likey=likey+1 where num="+num;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
	
	public String delete(String num) {
		String sql = "select filename from jsp_board where num="+num;
		String fileName = null;
		int result=0;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			if(rs.next()) {
				fileName = rs.getString("filename");
			}
			sql = "delete from jsp_board where num="+num;
			ps = con.prepareStatement(sql);
			result = ps.executeUpdate();
			if(result == 1) 
				return fileName;
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return fileName;
	}
	
	public int register(reDTO dto) {
		String sql="insert into jsp_board(num,id,title,content,filename,pdate,count)"
				+ " values(board_num.nextval,?,?,?,?,sysdate,0)";
		int result=0;
		try {
			con = DriverManager.getConnection(url,user,pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getTitle());
			ps.setString(3, dto.getContent());
			ps.setString(4, dto.getFilename());
			result = ps.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return result;
	}
	
	
}



