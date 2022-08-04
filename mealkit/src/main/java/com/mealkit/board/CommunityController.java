package com.mealkit.board;

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

    logger.info("register get ...........");
  }

  // @RequestMapping(value = "/register", method = RequestMethod.POST)
  // public String registPOST(BoardVO board, Model model) throws Exception {
  //
  // logger.info("regist post ...........");
  // logger.info(board.toString());
  //
  // service.regist(board);
  //
  // model.addAttribute("result", "success");
  //
  // //return "/board/success";
  // return "redirect:/board/listAll";
  // }

  @RequestMapping(value = "/write", method = RequestMethod.POST)
  public String writePOST(CommunityVO community, RedirectAttributes rttr) throws Exception {

    logger.info("regist post ...........");
    logger.info(community.toString());

    service.write(community);

    rttr.addFlashAttribute("msg", "SUCCESS");
    return "redirect:/";
  }

  @RequestMapping(value = "/listAll", method = RequestMethod.GET)
  public void listAll(Model model) throws Exception {

    logger.info("show all list......................");
    model.addAttribute("list", service.listAll());
  }

  @RequestMapping(value = "/read", method = RequestMethod.GET)
  public void read(@RequestParam("cNo") int cNo, Model model) throws Exception {

    model.addAttribute(service.read(cNo));
  }

  @RequestMapping(value = "/remove", method = RequestMethod.POST)
  public String remove(@RequestParam("cNo") int cNo, RedirectAttributes rttr) throws Exception {

    service.remove(cNo);

    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/board/listAll";
  }

  @RequestMapping(value = "/modify", method = RequestMethod.GET)
  public void modifyGET(int cNo, Model model) throws Exception {

    model.addAttribute(service.read(cNo));
  }

  @RequestMapping(value = "/modify", method = RequestMethod.POST)
  public String modifyPOST(CommunityVO community, RedirectAttributes rttr) throws Exception {

    logger.info("mod post............");

    service.modify(community);
    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/board/listAll";
  }

  @RequestMapping(value = "/listCri", method = RequestMethod.GET)
  public void listAll(Criteria cri, Model model) throws Exception {

    logger.info("show list Page with Criteria......................");

    model.addAttribute("list", service.listCriteria(cri));
  }

  @RequestMapping(value = "/listPage", method = RequestMethod.GET)
  public void listPage(@ModelAttribute("cri") Criteria cri, Model model) throws Exception {

    logger.info(cri.toString());

    model.addAttribute("list", service.listCriteria(cri));
    PageMaker pageMaker = new PageMaker();
    pageMaker.setCri(cri);
    // pageMaker.setTotalCount(131);

    pageMaker.setTotalCount(service.listCountCriteria(cri));

    model.addAttribute("pageMaker", pageMaker);
  }

  @RequestMapping(value = "/readPage", method = RequestMethod.GET)
  public void read(@RequestParam("cNo") int cNo, @ModelAttribute("cri") Criteria cri, Model model) throws Exception {

    model.addAttribute(service.read(cNo));
  }

  @RequestMapping(value = "/removePage", method = RequestMethod.POST)
  public String remove(@RequestParam("cNo") int cNo, Criteria cri, RedirectAttributes rttr) throws Exception {

    service.remove(cNo);

    rttr.addAttribute("page", cri.getPage());
    rttr.addAttribute("perPageNum", cri.getPerPageNum());
    rttr.addFlashAttribute("msg", "SUCCESS");

    return "redirect:/board/listPage";
  }

  @RequestMapping(value = "/modifyPage", method = RequestMethod.GET)
  public void modifyPagingGET(@RequestParam("cNo") int cNo, @ModelAttribute("cri") Criteria cri, Model model)
      throws Exception {

    model.addAttribute(service.read(cNo));
  }

}
