package com.Quiz.lesson01;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RequestMapping("/lesson01/quiz02")
@RestController
public class Quiz02RestController {
	
//	http://localhost:8080/lesson01/quiz02/1
	@RequestMapping("/1")
	public List<Map<String, Object>> quiz02_01(){
		Map<String, Object> map1 = new HashMap<>();
		Map<String, Object> map2 = new HashMap<>();
		Map<String, Object> map3 = new HashMap<>();
		Map<String, Object> map4 = new HashMap<>();
		Map<String, Object> map5 = new HashMap<>();
		
		List<Map<String, Object>> list = new ArrayList<>();
		map1.put("rate", 15);
		map1.put("director", "봉준호");
		map1.put("time", 131);
		map1.put("title", "기생충");
		list.add(map1);

		//강사님 답안
		// map1 = new HashMap<>();
		// 로 새로 heap 메모리에 생성하여 새로운 데이터 갑을 입력받아 대입한다
		
		map2.put("rate", 0);
		map2.put("director", "로베르토 베니니");
		map2.put("time", 116);
		map2.put("title", "인생은 아름다워");
		list.add(map2);
		
		map3.put("rate", 12);
		map3.put("director", "크리스토퍼 놀란");
		map3.put("time", 147);
		map3.put("title", "인셉션");
		list.add(map3);
		
		map4.put("rate", 19);
		map4.put("director", "윤종빈");
		map4.put("time", 133);
		map4.put("title", "범죄와의 전쟁 : 나쁜놈들의 시대");
		list.add(map4);
		
		map5.put("rate", 15);
		map5.put("director", "프란시스 로렌스");
		map5.put("time", 137);
		map5.put("title", "헝거게임");
		list.add(map5);
		
		return list;
	}
	
	@RequestMapping("/2")
	public List<Board> quiz02_02(){
		//브레이크 포인트 활용하기
		//F6(다음 줄 보기) 와  F8(다음 브레이크 포인트로 이동)활용
		List<Board> list = new ArrayList<>();
		Board board = new Board();
		board.setTitle("안녕하세요 가입인사 드립니다");
		board.setUesr("hagulu");
		board.setContent("안녕하세요 가입했어요. 앞으로 잘 부탁드립니다. 활동 열심히 하겠습니다");
		list.add(board);
		
		board = new Board();
		board.setTitle("헐 대박");
		board.setUesr("bada");
		board.setContent("오늘 목요일이었어... 금요일인줄");
		list.add(board);
		
		board = new Board();
		board.setTitle("오늘 데이트 한 이야기 해드릴게요");
		board.setUesr("dulumary");
		board.setContent("....");
		list.add(board);
		
		return list;
	}
	
	@RequestMapping("/3")
	public ResponseEntity<Board> quiz02_03(){
		Board board = new Board();
		board = new Board();
		board.setTitle("오늘 데이트 한 이야기 해드릴게요");
		board.setUesr("dulumary");
		board.setContent("....");
		
		return new ResponseEntity<>(board, HttpStatus.INTERNAL_SERVER_ERROR);
	}
}
