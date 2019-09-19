package com.book.warm.controller;

import java.util.ArrayList;

import javax.inject.Inject;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.book.warm.mapper.CommunityBoardMapper;
import com.book.warm.page.Criteria;
import com.book.warm.page.PageDTO;
import com.book.warm.vo.CommunityBoardVO;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommunityBoardController {
	
	@Inject
	CommunityBoardMapper communityBoardMapper;

	@RequestMapping(value = "/communityboard", method = RequestMethod.GET)
	public String communityBoard(Model model,@ModelAttribute("criteria") Criteria criteria) throws Exception {
		log.info("==================== communityBoard() ====================");
		ArrayList<CommunityBoardVO> communityBoardList = communityBoardMapper.getCommunityBoardListWithPaging(criteria);
		int numberOfPostsOnCommunityBoard=communityBoardMapper.getNumberOfPostsOnCommunityBoard();
		model.addAttribute("communityBoardList", communityBoardList);
		model.addAttribute("pageMaker", new PageDTO(criteria, numberOfPostsOnCommunityBoard));
		return "/communityboard";
	}

	@RequestMapping(value = "/communityboardview", method = RequestMethod.GET)
	public String communityBoardView(Model model,CommunityBoardVO communityBoardVO,@ModelAttribute("criteria") Criteria criteria) throws Exception {
		log.info("==================== communityBoardView() ====================");
		CommunityBoardVO sellectedCommunityBoardPost = communityBoardMapper.getCommunityBoardOne(communityBoardVO.getComm_no());
		model.addAttribute("sellectedCommunityBoardPost", sellectedCommunityBoardPost);
		return "/communityboardview";
	}

	@RequestMapping(value = "/communityboarddelete", method = RequestMethod.GET)
	public String communityBoardDelete(CommunityBoardVO communityBoardVO,RedirectAttributes rttr, @ModelAttribute("criteria") Criteria criteria) throws Exception {
		log.info("==================== communityBoardDelete() ====================");
		int deletePostNumber = communityBoardVO.getComm_no();
		communityBoardMapper.getCommunityBoardOneDelete(deletePostNumber);
		rttr.addAttribute("amount",criteria.getAmount());
		rttr.addAttribute("pageNum",criteria.getPageNum());
		log.info("==================== Delete Post Number : "+ deletePostNumber + "====================");
		return "redirect:communityboard";
	}

	@RequestMapping(value = "/communityboardmodify", method = RequestMethod.GET)
	public String communityboardmodify(Model model, CommunityBoardVO communityBoardVO,HttpServletRequest request,@ModelAttribute("criteria") Criteria criteria) throws Exception {
		log.info("==================== communityboardmodify() ====================");
		CommunityBoardVO modifyCommunityBoardPost = communityBoardMapper.getCommunityBoardOne(communityBoardVO.getComm_no());
		model.addAttribute("modifyCommunityBoardPost", modifyCommunityBoardPost);
		return "/communityboardmodify";
	}
	@RequestMapping(value = "/communityboardwrite", method = RequestMethod.GET)
	public String communityboardwrite() throws Exception {
		log.info("==================== communityboardwrite() ====================");
		return "/communityboardwrite";
	}
	@RequestMapping(value = "/communityBoardSaveModify", method = RequestMethod.POST)
	public String communityBoardSaveModify(RedirectAttributes rttr,CommunityBoardVO communityBoardVO,@ModelAttribute("criteria") Criteria criteria) throws Exception {
		log.info("==================== communityBoardSaveModify() ====================");
		communityBoardMapper.modifyCommunityBoardOne(communityBoardVO);
		rttr.addAttribute("amount",criteria.getAmount());
		rttr.addAttribute("pageNum",criteria.getPageNum());
		return "redirect:communityboard";
	}
	@RequestMapping(value = "/communityBoardSaveReplyWrite", method = RequestMethod.POST)
	public String communityBoardSaveReplyWrite(RedirectAttributes rttr, CommunityBoardVO communityBoardVO, Criteria criteria) throws Exception {
		log.info("==================== communityBoardSaveReplyWrite() ====================");
		communityBoardMapper.insertCommunityBoardReplyWrite(communityBoardVO);
		communityBoardMapper.replyshape(communityBoardVO);
		rttr.addAttribute("amount",criteria.getAmount());
		rttr.addAttribute("pageNum",criteria.getPageNum());
		return "redirect:communityboard";
	}
	
	@RequestMapping(value = "/communityboardreplywrite", method = RequestMethod.GET)
	public String communityboardreplywrite(String comm_no,Model model,@ModelAttribute("criteria") Criteria criteria,CommunityBoardVO communityBoardVO ) throws Exception {
		log.info("==================== communityboardreplywrite() ====================");
		CommunityBoardVO replyWriteCommunityBoardPost = communityBoardMapper.getCommunityBoardOne(communityBoardVO.getComm_no());
		model.addAttribute("replyWriteCommunityBoardPost",replyWriteCommunityBoardPost);
		return "/communityboardreplywrite";
	}
	
	@RequestMapping(value = "/communityBoardSaveWrite", method = RequestMethod.POST)
	public String communityBoardSaveWrite(CommunityBoardVO communityBoardVO) throws Exception {
		log.info("==================== communityBoardSaveWrite() ====================");
		communityBoardMapper.insertCommunityBoardWrite(communityBoardVO);
		return "redirect:communityboard";
	}

}