package com.app.alltt.member.service;

import java.util.List;
import java.util.Map;
import java.util.Random;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.alltt.member.dao.MemberDAO;
import com.app.alltt.member.dto.MemberDTO;

@Service
public class MemberServiceImpl implements MemberService {
	
	@Autowired
	private MemberDAO memberDAO;
	
	// 랜덤 닉네임 생성 메소드
	@Override
	public String genNickName() {
		
		String[] adverbs = {
		    "조금", "진짜", "확실히", "그리고", "대체로",
		    "특별히", "솔직히", "대단히", "점점", "아마",
		    "그저", "겨우", "아주", "어쩌면", "잠시",
		    "이제", "가장", "결코", "참", "의외로",
		    "너무", "기분좋게", "다소", "가끔", "정말",
		    "예쁘게", "완전히", "언제나", "계속해서", "왜냐하면",
		    "적극적으로", "실제로", "보통", "매우", "바로",
		    "과연", "절대로", "단순히", "꽤", "아직",
		    "일반적으로", "조용히", "부드럽게", "일부러", "항상",
		    "자주", "특히", "그냥", "주로", "거의"
		};
		//100
		String[] adjectives = {
		    "진한", "까다로운", "성실한", "답답한", "좋은",
		    "따뜻한", "빠른", "안정된", "긍정적인", "푸른",
		    "보라색", "노란", "짧은", "활발한", "깊은",
		    "많은", "부서지기쉬운", "확실한", "힘들은", "느린",
		    "지루한", "시큰한", "슬퍼하는", "평화로운", "낮은",
		    "부드러운", "재미있는", "적은", "낯선", "애절한",
		    "새로운", "조용한", "예쁜", "거대한", "얕은",
		    "매력적인", "오래된", "우울한", "쓰라린", "믿을수있는",
		    "약한", "어마무시한", "건장한", "미쳐있는", "큰",
		    "흰", "주황색", "의심스러운", "가까운", "유쾌한",
		    "알수없는", "불안한", "굵은", "얇은", "무례한",
		    "부자인", "혼자있는", "소심한", "유명한", "맑은",
		    "능동적인", "무서운", "넓은", "시원한", "익숙한",
		    "탁한", "회색", "무거운", "친절한", "필요한",
		    "추운", "붉은", "냉정한", "부정적인", "고운",
		    "좁은", "기뻐하는", "멋진", "차가운", "나쁜",
		    "밝은", "검은", "못된", "작은", "가난한",
		    "믿을수없는", "달콤한", "부끄러운", "어두운", "가벼운",
		    "혼란스러운", "단단한", "강한", "독특한", "더운",
		    "높은", "거친", "바람직한", "열정적인", "편안한"
		};
		//210
		String[] nouns = {
			"나탈리포트만", "블레이크라이블리", "알렉스와일러", "줄리아로버츠", "사라제시카파커",
		    "마고로비", "앤해서웨이", "애쉬튼커처", "네이탈리에포트만", "로버트다우니주니어",
		    "브래드피트", "카라델러비네", "클린트이스트우드", "로건레먼", "베네딕트컴버배치",
		    "맷데이먼", "킴벌리스트라우스", "제이슨메이마", "앤젤리나졸리", "라이언고슬링",
		    "레오나르도디카프리오", "리즈위더스푼", "톰크루즈", "엠마스톤", "라이언레이놀즈",
		    "셀린디온", "존트라볼타", "케이트윈슬렛", "조니뎁", "니콜키드먼",
		    "헤스티안", "헤일리베리", "제니퍼애니스톤", "크리스에반스", "다코타존슨",
		    "다코타패닝", "메릴스트립", "브루스윌리스", "톰행크스", "데미무어",
		    "조지클루니", "수잔새란든", "콜린퍼스", "캐서린제타존스", "제레미레너",
		    "케이트블란쳇", "제니퍼로렌스", "오웬윌슨", "애너해서웨이", "제이크질렌할",
		    "박해일", "김고은", "박민영", "임수정", "김수현", "이병헌", "한효주", "조여정", "손석구", "김유정",
		    "김혜수", "안성기", "문채원", "김소현", "김윤석", "임윤아", "한지민", "정재영", "김지원", "김태희",
		    "손예진", "김하늘", "하정우", "정유미", "고수"  , "이정재", "전도연", "김태리", "전혜빈", "이지아",
		    "한예슬", "서예지", "박보영", "전지현", "천우희", "김선아", "김민석", "송강호", "유연석", "이영애",
		    "박신혜", "김해숙", "송중기", "하지원", "박성웅", "이성민", "신민아", "강소라", "김희선", "엄정화",
		    "박신양", "공유",   "현빈",   "차예련", "나문희", "고두심", "강혜정", "이동욱", "이연희", "마동석",
		    "아이유", "방탄소년단", "블랙핑크", "엑소", "트와이스", "빅뱅", "마마무", "이엑스아이디", "아이즈원", "볼빨간사춘기",
		    "이하이", "갓세븐", "세븐틴", "레드벨벳", "워너원", "여자친구", "뉴이스트", "모모랜드", "이승기", "이수",
		    "백현", "마크툽", "장범준", "소녀시대", "에일리", "비투비", "에이핑크", "이적", "위너", "몬스타엑스",
		    "아스트로", "태연", "동방신기", "오마이걸", "김동률", "다비치", "펜타곤", "마이틴", "태민", "박효신",
		    "엔플라잉", "하현우", "빅스", "윤종신", "윤하", "웬디", "에디킴", "오마이걸반하나", "청하", "거미",
		    "강아지", "고양이", "사자", "호랑이", "코끼리", "기린", "원숭이", "판다", "사슴", "토끼",
		    "닭", "오리", "거북이", "악어", "뱀", "말", "소", "돼지", "양", "고래",
		    "상어", "물고기", "게", "오징어", "바다표범", "햄스터", "다람쥐", "고슴도치", "너구리", "쥐",
		    "매", "독수리", "물개", "오리너구리", "불가사리", "갈매기", "원앙", "불독", "푸들", "비글",
		    "치와와", "허스키", "불랙", "알파카", "치타", "하마", "하이에나", "오소리", "순록", "참새"
		};
		//26
		char[] alphabets = {
			'A', 'B', 'C', 'D', 'E', 'F', 'G', 'H', 'I', 'J',
            'K', 'L', 'M', 'N', 'O', 'P', 'Q', 'R', 'S', 'T',
            'U', 'V', 'W', 'X', 'Y', 'Z'
    	};
		//10
		String[] specialChar = {
            "!", "@", "#", "$", "%", "^", "&", "*", "-", "+"
	    };
		
		
		boolean isDupl = true;
		String ranNickName = null;
		
		while(isDupl) {
			ranNickName = adverbs[getRandomIdx(adverbs.length)] + "_" + adjectives[getRandomIdx(adjectives.length)] + "_" + 
					nouns[getRandomIdx(nouns.length)] + "_" + alphabets[getRandomIdx(alphabets.length)] + 
					specialChar[getRandomIdx(specialChar.length)] + getRandomIdx(100);
			List<MemberDTO> member = memberDAO.selectListNickName(ranNickName);
			if(member.size() == 0) isDupl = false;
		}
		
		return ranNickName;
	}
	
	// 랜덤값 생성 메서드
	private int getRandomIdx(int range) {
		
        Random random = new Random();
        int ranIndex = random.nextInt(range);
        return ranIndex;
        
    }
	
	@Override
	public MemberDTO getMemberByUserId(String userId) {
		return memberDAO.selectMemberByUsrId(userId);
	}
	
	@Override
	public void addNewMember(MemberDTO member) {
		
		memberDAO.insertMember(member);
	}
	
	@Override
	public void removeMember(long memberId) {
		
		memberDAO.deleteMember(memberId);
	}
	@Override
	public MemberDTO getMemberByMemberId(long memberId) {
		
		return memberDAO.selectOneMemberByMemberId(memberId);
		
	}
	@Override
	public void addWishContentByMemberId(Map<String, Long> wishMap) {
		memberDAO.insertWishContent(wishMap);
	}
	@Override
	public void deleteWishContentByMemberId(Map<String, Long> wishMap) {
		memberDAO.deleteWishContent(wishMap);
	}

	@Override
	public boolean isWishContent(Map<String, Long> wishMap) {
		return memberDAO.selectOneIsWishContent(wishMap);
	}
	
}
