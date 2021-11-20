package bookcart;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.Vector;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.jsp.JspWriter;
import javax.servlet.jsp.PageContext;

public class ReviewBoardMgr {

	private DBConnectionMgr pool;
	//private static final String  SAVEFOLDER = "C:/Jsp/myapp/WebContent/ch15/fileupload";
	private static final String ENCTYPE = "EUC-KR";
	private static int MAXSIZE = 5*1024*1024;

	public ReviewBoardMgr() {
		try {
			pool = DBConnectionMgr.getInstance();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	// 게시판 리스트
	public Vector<ReviewBoardBean> getBoardList(String keyField, String keyWord,
			int start, int end) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		Vector<ReviewBoardBean> vlist = new Vector<ReviewBoardBean>();
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select * from review order by ref desc, pos limit ?, ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setInt(1, start);
				pstmt.setInt(2, end);
			} else {
				sql = "select * from review where " + keyField + " like ? ";
				sql += "order by ref desc, pos limit ? , ?";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
				pstmt.setInt(2, start);
				pstmt.setInt(3, end);
			}
			rs = pstmt.executeQuery();
			while (rs.next()) {
				ReviewBoardBean bean = new ReviewBoardBean();
				bean.setRv_id(rs.getInt("rv_id"));
				bean.setUser_id(rs.getString("user_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setWr_date(rs.getString("wr_date"));
				bean.setHit(rs.getInt("hit"));
				vlist.add(bean);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return vlist;
	}
	
	//총 게시물수
	public int getTotalCount(String keyField, String keyWord) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		int totalCount = 0;
		try {
			con = pool.getConnection();
			if (keyWord.equals("null") || keyWord.equals("")) {
				sql = "select count(rv_id) from review";
				pstmt = con.prepareStatement(sql);
			} else {
				sql = "select count(rv_id) from review where " + keyField + " like ? ";
				pstmt = con.prepareStatement(sql);
				pstmt.setString(1, "%" + keyWord + "%");
			}
			rs = pstmt.executeQuery();
			if (rs.next()) {
				totalCount = rs.getInt(1);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return totalCount;
	}
	
	// 게시물 입력
	public void insertBoard(HttpServletRequest req) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		
		try {
			con = pool.getConnection();
			sql="select max(rv_id) from review";
			pstmt = con.prepareStatement(sql);
			rs = pstmt.executeQuery();
			int ref = 1;
			if (rs.next())
				ref = rs.getInt(1) + 1;
			String content = req.getParameter("content");
			sql = "insert review(user_id,content,subject,ref,pos,depth,wr_date,pass,hit,publisher,writer)";
			sql += "values(?, ?, ?, ?, 0, 0, now(), ?, 0,?,?)";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1,req.getParameter("user_id"));//!!!!!변경 필요
			pstmt.setString(2, content);
			pstmt.setString(3, req.getParameter("subject"));
			pstmt.setInt(4, ref);
			pstmt.setString(5, req.getParameter("pass"));
			pstmt.setString(6, req.getParameter("publisher"));
			pstmt.setString(7, req.getParameter("writer"));
			System.out.print(sql);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}
	
	// 게시물 리턴
	public ReviewBoardBean getBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		ResultSet rs = null;
		String sql = null;
		ReviewBoardBean bean = new ReviewBoardBean();
		try {
			con = pool.getConnection();
			sql = "select * from review where rv_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			rs = pstmt.executeQuery();
			if (rs.next()) {
				bean.setRv_id(rs.getInt("rv_id"));
				bean.setUser_id(rs.getString("user_id"));
				bean.setSubject(rs.getString("subject"));
				bean.setContent(rs.getString("content"));
				bean.setPublisher(rs.getString("publisher"));
				bean.setWriter(rs.getString("writer"));
				bean.setPos(rs.getInt("pos"));
				bean.setRef(rs.getInt("ref"));
				bean.setDepth(rs.getInt("depth"));
				bean.setWr_date(rs.getString("wr_date"));
				bean.setPass(rs.getString("pass"));
				bean.setHit(rs.getInt("hit"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
		return bean;
	}

	// 조회수 증가
	public void upCount(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update review set hit=hit+1 where rv_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 게시물 삭제
	public void deleteBoard(int num) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		ResultSet rs = null;
		try {
			con = pool.getConnection();
			sql = "delete from review where rv_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, num);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt, rs);
		}
	}

	// 게시물 수정
	public void updateBoard(ReviewBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update review set user_id=?,subject=?,content=?,writer=?,publisher=? where rv_id=?";
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUser_id());
			pstmt.setString(2, bean.getSubject());
			pstmt.setString(3, bean.getContent());
			pstmt.setString(4, bean.getWriter());
			pstmt.setString(5, bean.getPublisher());
			pstmt.setInt(6, bean.getRv_id());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 게시물 답변
	public void replyBoard(ReviewBoardBean bean) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert review (user_id,content,subject,writer,publisher,ref,pos,depth,wr_date,pass,hit)";
			sql += "values(?,?,?,?,?,?,?,?,now(),?,0)";
			int depth = bean.getDepth() + 1;
			int pos = bean.getPos() + 1;
			pstmt = con.prepareStatement(sql);
			pstmt.setString(1, bean.getUser_id());
			pstmt.setString(2, bean.getContent());
			pstmt.setString(3, bean.getSubject());
			pstmt.setString(4, bean.getWriter());
			pstmt.setString(5, bean.getPublisher());
			pstmt.setInt(6, bean.getRef());
			pstmt.setInt(7, pos);
			pstmt.setInt(8, depth);
			pstmt.setString(9, bean.getPass());
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}

	// 답변에 위치값 증가
	public void replyUpBoard(int ref, int pos) {
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "update review set pos = pos + 1 where ref=? and pos > ?";
			pstmt = con.prepareStatement(sql);
			pstmt.setInt(1, ref);
			pstmt.setInt(2, pos);
			pstmt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	/*
	//페이징 및 블럭 테스트를 위한 게시물 저장 메소드 
	public void post1000(){
		Connection con = null;
		PreparedStatement pstmt = null;
		String sql = null;
		try {
			con = pool.getConnection();
			sql = "insert tblBoard(name,content,subject,ref,pos,depth,regdate,pass,count,ip,filename,filesize)";
			sql+="values('aaa', 'bbb', 'ccc', 0, 0, 0, now(), '1111',0, '127.0.0.1', null, 0);";
			pstmt = con.prepareStatement(sql);
			for (int i = 0; i < 1000; i++) {
				pstmt.executeUpdate();
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			pool.freeConnection(con, pstmt);
		}
	}
	
	//main
	public static void main(String[] args) {
		new ReviewBoardMgr().post1000();
		System.out.println("SUCCESS");
	}*/
}