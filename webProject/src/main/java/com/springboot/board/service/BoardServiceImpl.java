package com.springboot.board.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.springboot.board.dao.BoardDAO;
import com.springboot.board.vo.BoardCommentVO;
import com.springboot.board.vo.BoardVO;
import com.springboot.board.vo.LikedVO;
import com.springboot.common.vo.Criteria;

@Service("boardService")
@Transactional(propagation = Propagation.REQUIRED)
public class BoardServiceImpl implements BoardService {
	@Autowired
	BoardDAO boardDAO;

	public List<BoardVO> listArticles() throws Exception {
		List<BoardVO> articlesList = boardDAO.selectAllArticlesList();
		return articlesList;
	}

	// 단일 이미지 추가하기
	/*
	 * @Override public int addNewArticle(Map articleMap) throws Exception{ return
	 * boardDAO.insertNewArticle(articleMap); }
	 */

	// 다중 이미지 추가하기

	@Override
	public int addNewArticle(Map articleMap) throws Exception {
		int articleNO = boardDAO.insertNewArticle(articleMap);
		articleMap.put("articleNO", articleNO);
		boardDAO.insertNewImage(articleMap);
		return articleNO;
	}

	@Override
	public Map selectViewArticle(int articleNO) throws Exception {
		Map resultMap = new HashMap();
		BoardVO board = boardDAO.selectViewArticle(articleNO);
		List<BoardCommentVO> commentList = boardDAO.selectAllComment(articleNO);
		boardDAO.updateViewCount(articleNO);

		resultMap.put("board", board);
		resultMap.put("comment", commentList);

		return resultMap;
	}

	public String selectOneArticle(int articleNO) throws Exception {
		return boardDAO.selectOneArticle(articleNO);
	}

	// 다중 파일 보이기
//	@Override
//	public Map viewArticle(int articleNO) throws Exception {
//		Map articleMap = new HashMap();
//		BoardVO articleVO = boardDAO.selectArticle(articleNO);
//		List<ImageVO> imageFileList = boardDAO.selectImageFileList(articleNO);
//		articleMap.put("article", articleVO);
//		articleMap.put("imageFileList", imageFileList);
//		return articleMap;
//	}

	// 단일 파일 보이기
	/*
	 * @Override public ArticleVO viewArticle(int articleNO) throws Exception{
	 * ArticleVO articleVO = boardDAO.selectArticle(articleNO); return articleVO; }
	 */

//	@Override
//	public void modArticle(Map articleMap) throws Exception {
//		boardDAO.updateArticle(articleMap);
//	}

	@Override
	public void removeArticle(int articleNO) throws Exception {
		boardDAO.deleteArticle(articleNO);
	}

	@Override
	public int insertBoard(BoardVO vo) throws Exception {
		int result = boardDAO.insertBoard(vo);
		return result;
	}

	public String test() throws Exception {
		return boardDAO.test(1);
	}

	@Override
	public void updateBoard(BoardVO vo) {
		boardDAO.updateArticle(vo);

	}

	@Override
	public int addBoardComment(BoardCommentVO boardComment) {
		int result = boardDAO.addBoardComment(boardComment);
		int articleNO = boardComment.getArticleNO();
		boardDAO.updateUCommentCnt(articleNO);
		return result;
	}

	// 기본 게시글 게시판 리스트(최신순)

	@Override
	public List myArticleList1(Criteria cri) throws Exception {
		List myArticleList = boardDAO.myArticleList1(cri);

		return myArticleList;

	}

	@Override
	public int totalArticlePage1(Criteria cri) throws Exception {
		return boardDAO.totalArticlePage1(cri);

	}

	// 인기순으로 조회한 게시판 리스트

	@Override
	public List myArticleList2(Criteria cri) throws Exception {
		List myArticleList = boardDAO.myArticleList2(cri);

		return myArticleList;

	}

	// 카테고리별 게시판
	@Override
	public List myArticleList3(Criteria cri) throws Exception {
		List myArticleList = boardDAO.myArticleList3(cri);

		return myArticleList;

	}

	@Override
	public int totalArticlePage2(Criteria cri) throws Exception {
		return boardDAO.totalArticlePage2(cri);

	}

	// 좋아요
	@Override
	public void insertBoardLike(LikedVO liked) throws Exception {
		boardDAO.createBoardLike(liked);
		boardDAO.updateBoardLike(liked.getArticleNO());
	}

	@Override
	public void deleteBoardLike(LikedVO liked) throws Exception {
		boardDAO.deleteBoardLike(liked);
		boardDAO.updateBoardLike(liked.getArticleNO());
	}

	@Override
	public int getBoardLike(LikedVO liked) throws Exception {
		return boardDAO.getBoardLike(liked);
	}

	// 내가 쓴 댓글 조회
	@Override
	public List myCommentList(Criteria cri) throws Exception {
		List myCommentList = boardDAO.myCommentList(cri);

		return myCommentList;

	}

	//보드 게시글 개수 추가
	@Override
	public int totalCommentPage(Criteria cri) throws Exception {
		return boardDAO.totalCommentPage(cri);

	}

	// 보드 게시글 개수 삭제
	@Override
	public int removecomment(BoardCommentVO bc) throws Exception {
		int articleNO = bc.getArticleNO();
			boardDAO.updateDCommentCnt(articleNO);
		return boardDAO.removecomment(bc);
	}

}