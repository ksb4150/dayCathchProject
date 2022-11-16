package com.springboot.member.service;

import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.springframework.dao.DataAccessException;

import com.springboot.member.vo.KakaoVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.member.vo.NaverVO;

public interface MemberService {
//	public List listMembers() throws DataAccessException;
	public int addMember(MemberVO member) throws DataAccessException;

//	public int removeMember(String id) throws DataAccessException;
	public void memberModify(MemberVO memberVO) throws Exception;

//	public MemberVO modMemberInfo(String id) throws DataAccessException;
	public MemberVO login(MemberVO memberVO) throws Exception;

	public String userIdOverlapCheckService(String userId) throws Exception;

	public String getAccessToken(String authorize_code) throws DataAccessException;

	public MemberVO getUserInfo(String access_Token) throws DataAccessException;

	public MemberVO naverSave(MemberVO naver) throws DataAccessException;

	public void phoneCheck(String userPhoneNumber, int randomNumber) throws Exception;

	public MemberVO getMemberInfo(String uid);

	public MemberVO findId(MemberVO member) throws Exception;

	public void phone_pwd(MemberVO member, String div) throws Exception;

	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception;

	public int findPwCheck(MemberVO memberVO) throws Exception;

	public int businessAddMember(MemberVO member) throws DataAccessException;

	public Map selectBusinessMember(String uid) throws DataAccessException;

	public int updateMemberModify(Map businessMemberMap) throws DataAccessException;

	// 마이페이지 정보 채우기
	public int cartCount(String uid) throws Exception;

	public int likeCount(String uid) throws Exception;

	public int totalOrderCount(String uid) throws Exception;

	public int totalOrderCancelCount(String uid) throws Exception;

	public int csCount(String uid) throws Exception;

	public int articleCount(String uid) throws Exception;

	public int commentCount(String uid) throws Exception;

	// 회원 탈퇴
	public void memberDelete(MemberVO memberVO) throws Exception;

	public int passChk(MemberVO memberVO) throws Exception;

	// 암호화 비밀번호 변경
	public void pwUpdate(MemberVO member) throws Exception;
	
	public int businessorderCount(String uid) throws Exception;

	public int businessorderCancelCount(String uid) throws Exception;

	public int enrollGoods(String uid) throws Exception;

	public int waitingGoods(String uid) throws Exception;

	public Integer businessEarning(String uid) throws Exception;
}
