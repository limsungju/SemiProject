package members;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO {
	private String url = "jdbc:oracle:thin:@localhost:1521:xe";
	private String user = "jsp";
	private String pwd = "1234";
	private Connection con;
	private PreparedStatement ps;
	private ResultSet rs;

	public MemberDAO() {
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");

		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		}
	}

	public int userCheck(String id, String pawd) {
		String sql = "select * from members where id='" + id + "'";
		int count = 0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				count++;

				if (rs.getString("pwd").equals(pawd)) {
					count++;

				}
			}
		} catch (SQLException e) {

			e.printStackTrace();
		}

		return count;

	}

	public ArrayList<MemberDTO> memberView() {
		String sql = "select * from members";
		ArrayList<MemberDTO> memberList = new ArrayList<>();

		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				MemberDTO mb = new MemberDTO();
				mb.setId(rs.getString("id"));
				mb.setPwd(rs.getString("pwd"));
				mb.setName(rs.getString("name"));
				mb.setAddr(rs.getString("addr"));
				mb.setTel(rs.getString("tel"));
				memberList.add(mb);
				

			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return memberList;

	}

	public int register(MemberDTO md) {
		String sql = "insert into members(id,pwd,name,addr,tel) values(?,?,?,?,?)";
		int howRow=0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);

			ps.setString(1, md.getId());
			ps.setString(2, md.getPwd());
			ps.setString(3, md.getName());
			ps.setString(4, md.getAddr());
			ps.setString(5, md.getTel());

			rs = ps.executeQuery();
			howRow++;

		} catch (SQLException e) {

			e.printStackTrace();
		}
		return howRow;
	}

	public int delete(String md) {
		String sql = "delete from members where id='" + md + "'";
		int count =0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			count++;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return count;

	}

	public int changeUser(MemberDTO md) {
		String sql = "update members set name=?, addr=?, tel=? where id='" + md.getId() + "'";
		int count =0;
		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			ps.setString(1, md.getName());
			ps.setString(2, md.getAddr());
			ps.setString(3, md.getTel());

			rs = ps.executeQuery();
			count++;
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return count;

	}
	public MemberDTO memberView(String id) {
		String sql = "select * from members where id='" + id + "'";
		MemberDTO mb = new MemberDTO();

		try {
			con = DriverManager.getConnection(url, user, pwd);
			ps = con.prepareStatement(sql);
			rs = ps.executeQuery();
			while (rs.next()) {
				mb.setId(rs.getString("id"));
				mb.setPwd(rs.getString("pwd"));
				mb.setName(rs.getString("name"));
				mb.setAddr(rs.getString("addr"));
				mb.setTel(rs.getString("tel"));


			}
		} catch (SQLException e) {

			e.printStackTrace();
		}
		return mb;

	}

}
