package com.kongkong.member.web;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kongkong.code.service.ICodeService;
import com.kongkong.code.vo.CodeVO;
import com.kongkong.member.service.IMemberService;
import com.kongkong.member.vo.MemberSearchVO;
import com.kongkong.member.vo.MemberVO;

@Controller
public class MemberController {
	
	private Logger logger = LoggerFactory.getLogger(getClass());

	@Autowired
	IMemberService memberService;
	
	@Inject
	private ICodeService codeService;
	
	@ModelAttribute("categories")
	public List<CodeVO> category() {
		logger.debug("카테고리 공통코드를 처리합니다.");
		List<CodeVO> categories =  codeService.getCodeListByParent("CO00");
		return categories;
	}
	
	@RequestMapping("/member/memberList.wow")
	public String memberList(Model model, @ModelAttribute("searchVO") MemberSearchVO searchVO) {
		logger.debug("{} " + searchVO);
		List<MemberVO> memberList = memberService.getMemberList(searchVO);
		model.addAttribute("memberList", memberList);
		return "member/memberList";
	}
	
	@RequestMapping("/member/memberView.wow")
	private String memberView(Model model, String memId) {
		MemberVO member = memberService.getMember(memId);
		model.addAttribute("member", member);
		return "member/memberView";
	}
	
	@RequestMapping("/member/adminMemDel.wow")
	private String memberDelete(String id) {
		memberService.memberDelete(id);
		return "member/memberView";
	}
	
	@RequestMapping("/admin/memPrivacy.wow")
	private String memPrivacy(String memId, Model model) {
		
		MemberVO member = memberService.getMember(memId);
		model.addAttribute("member", member);
		
		return "admin/memPrivacy";
		}
		
	@RequestMapping("/admin/adminChangeModify.wow")
	private String adminChangeModify(@ModelAttribute("member") MemberVO member, Model model) {
		
		memberService.modifyMember(member);
		
		return "redirect:/member/memberList.wow";
	}
	
}
