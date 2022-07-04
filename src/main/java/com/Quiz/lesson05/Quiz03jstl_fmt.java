package com.Quiz.lesson05;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class Quiz03jstl_fmt {
	
//	http://localhost:8080/lesson05/quiz03
	@RequestMapping("/lesson05/quiz03")
	public String quiz03_1(Model model) {
		//1)
		List<Integer> candidates = new ArrayList<>();
		candidates.add(263001);
		candidates.add(173942); 
		candidates.add(563057); 
		
		//총 투표 인원 구하기
		int totalCount = 0;
		for(Integer candidate : candidates) {
			totalCount += candidate;
		}
		
		model.addAttribute("candidates", candidates);
		model.addAttribute("totalCount", totalCount);
		
		//2)
		List<Map<String, Object>> cardBills = new ArrayList<>();
		Date today = new Date();
		
		Map<String, Object> cardBill = new HashMap<>();
		cardBill.put("store", "GS48");
		cardBill.put("pay", 7800);
		cardBill.put("date", "2025-09-14");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "현태백화점");
		cardBill.put("pay", 2750000);
		cardBill.put("date", "2025-09-18");
		cardBill.put("installment", "3개월");
		cardBills.add(cardBill);

		cardBill = new HashMap<>();
		cardBill.put("store", "요촌치킨");
		cardBill.put("pay", 180000);
		cardBill.put("date", "2025-09-20");
		cardBill.put("installment", "일시불");
		cardBills.add(cardBill);
		
		model.addAttribute("cardBills", cardBills);
		model.addAttribute("today", today);
		
		return "lesson05/jstl_fmt";
	}
}
