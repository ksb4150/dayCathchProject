package com.springboot.board.service;

import java.util.List;
import java.util.Map;

import com.springboot.board.vo.BoardCommentVO;
import com.springboot.board.vo.BoardVO;
import com.springboot.board.vo.LikedVO;
import com.springboot.common.vo.Criteria;

public interface BoardService {
	public List<BoardVO> listArticles() throws Exception;

	public int addNewArticle(Map articleMap) throws Exception;

	/* public ArticleVO viewArticle(int articleNO) throws Exception; */
	// public Map viewArticle(int articleNO) throws Exception;
//	public void modArticle(Map articleMap) throws Exception;
	public void removeArticle(int articleNO) throws Exception;

	public int insertBoard(BoardVO vo) throws Exception;

	public Map selectViewArticle(int articleNO) throws Exception;

	public String test() throws Exception;

	public String selectOneArticle(int articleNO) throws Exception;

	public void updateBoard(BoardVO vo);

	public int addBoardComment(BoardCommentVO boardComment);

	public List myArticleList1(Criteria cri) throws Exception;

	public List myArticleList2(Criteria cri) throws Exception;

	public List myArticleList3(Criteria cri) throws Exception;

	public int totalArticlePage1(Criteria cri) throws Exception;

	public int totalArticlePage2(Criteria cri) throws Exception;

	public void insertBoardLike(LikedVO liked) throws Exception;

	public void deleteBoardLike(LikedVO liked) throws Exception;

	public int getBoardLike(LikedVO liked) throws Exception;

	public List myCommentList(Criteria cri) throws Exception;

	public int totalCommentPage(Criteria cri) throws Exception;

	// 내 댓글 삭제
	public int removecomment(BoardCommentVO bc) throws Exception;
}
