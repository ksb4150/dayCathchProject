package com.springboot.member.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.member.vo.KakaoVO;
import com.springboot.member.vo.MemberVO;
import com.springboot.member.vo.NaverVO;

@Mapper
@Repository("memberDAO")
public interface MemberDAO {
	public List selectAllMemberList() throws DataAccessException;

	public int insertMember(MemberVO memberVO) throws DataAccessException;

	public int deleteMember(String id) throws DataAccessException;

	public MemberVO loginById(MemberVO memberVO) throws DataAccessException;

	public int modMember(MemberVO memberVO);

	public MemberVO modMemberInfo(String id) throws DataAccessException;

	public String userIdOverlapCheck(String userId) throws Exception;

	public void kakaoinsert(HashMap<String, Object> userInfo) throws DataAccessException;

	public MemberVO findkakao(HashMap<String, Object> userInfo) throws DataAccessException;

	public MemberVO findNaver(MemberVO naver) throws DataAccessException;

	public void naverInsert(MemberVO naver) throws DataAccessException;

	public void memberModify(MemberVO memberVO) throws DataAccessException;

	public MemberVO getMemberInfo(String uid);

	// 사업자 회원가입
	public int insertBusinessAddmember(MemberVO memberVO) throws DataAccessException;

	public MemberVO findId(MemberVO member) throws DataAccessException;

	// 회원있는지 여부 확인
	public MemberVO pwFind_Lookup(String userId) throws DataAccessException;

	// 회원 비밀번호 가져오기
	public MemberVO pwFind_select(MemberVO member) throws DataAccessException;

	public void updatePw(MemberVO member) throws DataAccessException;

	public int idCheck(String userId);

	public int findPwCheck(MemberVO member);

	public MemberVO selectBusinessMember(String uid) throws DataAccessException;

	public int updateModMember(Map businessMemberMap) throws DataAccessException;

	// 마이페이지 정보 채우기
	public int cartCount(String uid) throws DataAccessException;

	public int likeCount(String uid) throws DataAccessException;

	public int totalOrderCount(String uid) throws DataAccessException;

	public int totalOrderCancelCount(String uid) throws DataAccessException;

	public int csCount(String uid) throws DataAccessException;

	public int articleCount(String uid) throws DataAccessException;

	public int commentCount(String uid) throws DataAccessException;

	public int sumSavePoint(String uid) throws DataAccessException;

	public int sumUsePoint(String uid) throws DataAccessException;

	// 회원 탈퇴
	public void memberDelete(MemberVO memberVO) throws DataAccessException;

	public int passChk(MemberVO memberVO) throws DataAccessException;

	// 암호화 비밀번호 변경
	public String pwCheck(String userId) throws DataAccessException;

	public void pwUpdate(MemberVO member) throws DataAccessException;
	
	public int businessorderCount(String uid) throws DataAccessException;

	public int businessorderCancelCount(String uid) throws DataAccessException;

	public int enrollGoods(String uid) throws DataAccessException;

	public int waitingGoods(String uid) throws DataAccessException;

	public Integer businessEarning(String uid) throws DataAccessException;

}
