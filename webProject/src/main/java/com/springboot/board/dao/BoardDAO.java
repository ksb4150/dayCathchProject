package com.springboot.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.springboot.board.vo.BoardCommentVO;
import com.springboot.board.vo.BoardVO;
import com.springboot.board.vo.LikedVO;
import com.springboot.common.vo.Criteria;

@Mapper
@Repository("boardDAO")
public interface BoardDAO {
	public List selectAllArticlesList() throws DataAccessException;

	public int insertNewArticle(Map articleMap) throws DataAccessException;

	public void insertNewImage(Map articleMap) throws DataAccessException;

	public BoardVO selectArticle(int articleNO) throws DataAccessException;

	public void updateArticle(BoardVO vo) throws DataAccessException;

	public void deleteArticle(int articleNO) throws DataAccessException;

	public List selectImageFileList(int articleNO) throws DataAccessException;

	public int insertBoard(BoardVO vo) throws DataAccessException;

	public BoardVO selectViewArticle(int articleNO) throws DataAccessException;

	public String test(int i);

	public String selectOneArticle(int articleNO);

	public void updateViewCount(int articleNO);

	public int addBoardComment(BoardCommentVO boardComment);

	public List<BoardCommentVO> selectAllComment(int articleNO);

	public List myArticleList1(Criteria cri) throws DataAccessException;

	public int totalArticlePage1(Criteria cri) throws DataAccessException;

	public List myArticleList2(Criteria cri) throws DataAccessException;

	public int totalArticlePage2(Criteria cri) throws DataAccessException;

	public List myArticleList3(Criteria cri) throws DataAccessException;

	public int getBoardLike(LikedVO liked) throws DataAccessException;

	public void createBoardLike(LikedVO liked) throws DataAccessException;

	public void deleteBoardLike(LikedVO liked) throws DataAccessException;

	public void updateBoardLike(int articleNO) throws DataAccessException;

	public List myCommentList(Criteria cri) throws DataAccessException;

	public int totalCommentPage(Criteria cri) throws DataAccessException;

	public int removecomment(BoardCommentVO bc) throws DataAccessException;

	//댓글 개수 추가
	public void updateUCommentCnt(int articleNO) throws DataAccessException;
	//댓글 개수 삭제
	public void updateDCommentCnt(int articleNO) throws DataAccessException;
}
