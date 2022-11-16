package com.springboot.member.service;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.RandomStringUtils;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;
import com.springboot.member.dao.MemberDAO;
import com.springboot.member.vo.MemberVO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
@Transactional(propagation = Propagation.REQUIRED)
public class MemberServiceImpl implements MemberService {
	@Autowired
	MemberDAO memberDAO;

	@Autowired
	private HttpSession session;
	
	@Autowired
	private PasswordEncoder pwEncoder;

	public MemberServiceImpl() {

	}

	@Override
	public MemberVO login(MemberVO memberVO) throws Exception {
		return memberDAO.loginById(memberVO);
	}

	@Override
	public int addMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertMember(member);
	}

	@Override
	public int businessAddMember(MemberVO member) throws DataAccessException {
		return memberDAO.insertBusinessAddmember(member);
	}

	@Override
	public String userIdOverlapCheckService(String userId) throws Exception {
		String result = memberDAO.userIdOverlapCheck(userId);
		if (result == null) {
			return "null";
		}
		return result;
	}

	// 비지니스 회원정보 수정
	@Override
	public Map selectBusinessMember(String uid) {
		Map<String, Object> businessMemberMap = new HashMap<>();

		MemberVO businessMember = memberDAO.selectBusinessMember(uid);
		businessMemberMap.put("businessMember", businessMember);

		return businessMemberMap;
	}

	@Override
	public int updateMemberModify(Map businessMemberMap) {
		return memberDAO.updateModMember(businessMemberMap);
	}
//
//	@Override
//	public int removeMember(String id) throws DataAccessException {
//		return memberDAO.deleteMember(id);
//	}
//	

	@Override
	public void memberModify(MemberVO memberVO) throws Exception {
		memberDAO.memberModify(memberVO);
	}

//	@Override
//	public MemberVO modMemberInfo(String id) throws DataAccessException {
//		MemberVO vo = null;
//				vo = memberDAO.modMemberInfo(id);
//		
//		return vo;
//	}


	// 카카오 로그인 정보 저장
	@Override
	public String getAccessToken(String authorize_code) throws DataAccessException {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";

		try {
			URL url = new URL(reqURL);

			HttpURLConnection conn = (HttpURLConnection) url.openConnection();

			// POST 요청을 위해 기본값이 false인 setDoOutput을 true로

			conn.setRequestMethod("POST");
			conn.setDoOutput(true);

			// POST 요청에 필요로 요구하는 파라미터 스트림을 통해 전송
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=c3b3b906a5d5fcfc1f9e4e2cab90cad5"); // 본인이 발급받은 key
			sb.append("&redirect_uri=http://localhost:8080/oauth/kakao"); // 본인이 설정해 놓은 경로
			sb.append("&code=" + authorize_code);
			bw.write(sb.toString());
			bw.flush();

			// 결과 코드가 200이라면 성공
			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			// 요청을 통해 얻은 JSON타입의 Response 메세지 읽어오기
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			// Gson 라이브러리에 포함된 클래스로 JSON파싱 객체 생성
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();

			System.out.println("access_token : " + access_Token);
			System.out.println("refresh_token : " + refresh_Token);

			br.close();
			bw.close();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return access_Token;
	}

	// 카카오 로그인 정보 저장
	@Override
	public MemberVO getUserInfo(String access_Token) throws DataAccessException {

		// 요청하는 클라이언트마다 가진 정보가 다를 수 있기에 HashMap타입으로 선언
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");

			// 요청에 필요한 Header에 포함될 내용
			conn.setRequestProperty("Authorization", "Bearer " + access_Token);

			int responseCode = conn.getResponseCode();
			System.out.println("responseCode : " + responseCode);

			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));

			String line = "";
			String result = "";

			while ((line = br.readLine()) != null) {
				result += line;
			}
			System.out.println("response body : " + result);

			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);

			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();

			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			String Uuid = RandomStringUtils.random(6, true, true);

			userInfo.put("uid", Uuid);
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
			userInfo.put("userType", 1);

		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		MemberVO result = memberDAO.findkakao(userInfo);
		System.out.println("S:" + result);
		
		if (result == null) {
			memberDAO.kakaoinsert(userInfo);
			return memberDAO.findkakao(userInfo);
		} else {
			return result;
		}
		
	}

	// 네이버 로그인 정보 저장 및 로그인처리
	@Override
	public MemberVO naverSave(MemberVO naver) throws DataAccessException {
		MemberVO check = memberDAO.findNaver(naver);
		String result = "no";
		if (check == null) {

			memberDAO.naverInsert(naver);
			check= memberDAO.findNaver(naver);
			session.invalidate();

			return check;

		} else {
			session.invalidate();

			return check;
		}
	}

	// 휴대폰번호 인증문자 보내기
		@Override
		public void phoneCheck(String userPhoneNumber, int randomNumber) throws Exception {
			String api_key = "NCSL45I65HWL8GI5";
			String api_secret = "CB7KZZNPVVOSV3MD2HXAE73UCMP34XVP";
			Message coolsms = new Message(api_key, api_secret);

			HashMap<String, String> params = new HashMap<String, String>();
			params.put("to", userPhoneNumber); // 수신전화번호
			params.put("from", "01048899570"); // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
			params.put("type", "SMS");
			params.put("text", "[TEST] 날잡아 인증번호는" + "[" + randomNumber + "]" + "입니다."); // 문자 내용 입력
			params.put("app_version", "test app 1.2"); // application name and version

			try {
				JSONObject obj = (JSONObject) coolsms.send(params);
				System.out.println(obj.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}

		}

		// 휴대폰번호로 비밀번호 찾기
		@Override
		public void phone_pwd(MemberVO member, String div) throws Exception {

			String api_key = "NCSL45I65HWL8GI5";
			String api_secret = "CB7KZZNPVVOSV3MD2HXAE73UCMP34XVP";
			Message coolsms = new Message(api_key, api_secret);

			HashMap<String, String> params = new HashMap<String, String>();

			if (div.equals("findpw")) {
				params.put("to", member.getUserPhoneNumber()); //  수신전화번호
				params.put("from", "01048899570"); //발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
				params.put("type", "SMS");
				params.put("text", "[TEST] 날잡아 임시 비밀번호는" + "[" + member.getUserPwd() + "]" + "입니다"); // 문자 내용 입력
				params.put("app_version", "test app 1.2"); // application name and version
			}

			JSONObject obj = (JSONObject) coolsms.send(params);
			System.out.println(obj.toString());

		}

	@Override
	public MemberVO getMemberInfo(String uid) {

		return memberDAO.getMemberInfo(uid);

	}

	@Override
	public MemberVO findId(MemberVO member) throws Exception {
		return memberDAO.findId(member);
	}

	@Override
	public int findPwCheck(MemberVO memberVO) throws Exception {
		return memberDAO.findPwCheck(memberVO);
	}

	// 비밀번호 찾기
	@Override
	public void findPw(HttpServletResponse response, MemberVO vo) throws Exception {
		response.setContentType("text/html;charset=utf-8");
		MemberVO ck = memberDAO.pwFind_Lookup(vo.getUserId());
		PrintWriter out = response.getWriter();
		// 가입된 아이디가 없으면
		if (memberDAO.idCheck(vo.getUserId()) == 0) {
			out.print("등록되지 않은 아이디입니다.");
			out.close();
		}
		// 가입된 휴대폰번호가 아니면
		else if (!vo.getUserPhoneNumber().equals(ck.getUserPhoneNumber())) {
			out.print("등록되지 않은 번호입니다.");
			out.close();
		} else {
			// 임시 비밀번호 생성
			String pw = "";
			for (int i = 0; i < 12; i++) {
				pw += (char) ((Math.random() * 26) + 97);
			}
			System.out.println("임시비밀번호 :" + pw);
			vo.setUserPwd(pw);
			phone_pwd(vo, "findpw");
			vo.setUserPwd(pwEncoder.encode(pw));
			System.out.println("암호화된 비밀번호 :" + vo.getUserPwd());
			memberDAO.updatePw(vo);
			out.print("임시 비밀번호를 발송하였습니다. 로그인 후 비밀번호를 수정해주세요");
			out.close();
		}
	}

	// 마이페이지 정보 채우기
	@Override
	public int cartCount(String uid) throws Exception {
		return memberDAO.cartCount(uid);
	}

	@Override
	public int likeCount(String uid) throws Exception {
		return memberDAO.likeCount(uid);
	}

	@Override
	public int totalOrderCount(String uid) throws Exception {
		return memberDAO.totalOrderCount(uid);
	}

	@Override
	public int totalOrderCancelCount(String uid) throws Exception {
		return memberDAO.totalOrderCancelCount(uid);
	}

	@Override
	public int csCount(String uid) throws Exception {
		return memberDAO.csCount(uid);
	}

	@Override
	public int articleCount(String uid) throws Exception {
		return memberDAO.articleCount(uid);
	}

	@Override
	public int commentCount(String uid) throws Exception {
		return memberDAO.commentCount(uid);
	}

	@Override
	public void memberDelete(MemberVO memberVO) throws Exception {
		memberDAO.memberDelete(memberVO);
	}

	@Override
	public int passChk(MemberVO memberVO) throws Exception {
		int result = memberDAO.passChk(memberVO);
		return result;
	}

	// 암호화 비밀번호 변경

	@Override
	public void pwUpdate(MemberVO member) throws Exception {
		memberDAO.pwUpdate(member);
	}
	
	//사업자 메인페이지에 보내줄 정보	
		@Override
		public int businessorderCount(String uid) throws Exception {
			return memberDAO.businessorderCount(uid);
		}
		
		@Override
		public int businessorderCancelCount(String uid) throws Exception {
			return memberDAO.businessorderCancelCount(uid);
		}
		
		@Override
		public int enrollGoods(String uid) throws Exception {
			return memberDAO.enrollGoods(uid);
		}
		
		@Override
		public int waitingGoods(String uid) throws Exception {
			return memberDAO.waitingGoods(uid);
		}
		
		@Override
		public Integer businessEarning(String uid) throws Exception {
			return memberDAO.businessEarning(uid);
		}
}
