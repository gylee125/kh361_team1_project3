package com.mealkit.board;

import java.util.List;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/community/*")
public class CommunityController {

	private static final Logger logger = LoggerFactory.getLogger(CommunityController.class);

	@Inject
	private CommunityService service;

	@RequestMapping(value = "/write", method = RequestMethod.GET)
	public void writeGET(CommunityVO community, Model model) throws Exception {

		logger.info("write get ...........");
	}

	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public String writePOST(CommunityVO community, RedirectAttributes rttr) throws Exception {

		logger.info("write post ...........");
		logger.info(community.toString());

		service.write(community);

		rttr.addFlashAttribute("msg", "SUCCESS");
		return "redirect:/community/list";
	}

	@RequestMapping(value = "/list", method = RequestMethod.GET)
	public void list(Model model, @ModelAttribute("scri") SearchCriteria scri) throws Exception {

		logger.info("show all list......................");

		model.addAttribute("list", service.list(scri));
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(scri);
		pageMaker.setTotalCount(service.listCount(scri));
		
		model.addAttribute("pageMaker", pageMaker);
	}

	@RequestMapping(value = "/read", method = RequestMethod.GET)
	public void read(@RequestParam("cNo") int cNo, Model model) throws Exception {

		model.addAttribute("CommunityVO", service.read(cNo));
	}

	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	public String remove(@RequestParam("cNo") int cNo, RedirectAttributes rttr) throws Exception {

		service.delete(cNo);

		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/community/list";
	}

	@RequestMapping(value = "/update", method = RequestMethod.GET)
	public void modifyGET(int cNo, Model model) throws Exception {

		model.addAttribute("CommunityVO", service.read(cNo));
	}

	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String modifyPOST(CommunityVO community, RedirectAttributes rttr) throws Exception {

		logger.info("mod post............");

		service.update(community);
		rttr.addFlashAttribute("msg", "SUCCESS");

		return "redirect:/community/list";
	}

}
