var speed = 800;    // 스크롤 스피드 수치로 사용할 변수 
     
//로직
function scrolling(obj){
    if (!obj){  // 예외처리, 현재는 기능적으로 필요한 부분은 아님, 관례적 사용
        $('html, body').animate({scrollTop:0},speed);
    }else{
        var posTop = $(obj).offset().top -80;   // posTop = 매개변수로 들어온 컨텐츠 obj 의 offset().top - 네비게이션 높이
        $('html, body').animate({scrollTop:posTop}, speed ) // body의 스크롤이동 : posTop
    }
};
 
 
$("nav div div ul li a").click(function(){  // 네비게이션 클릭시
    var direction = $(this).attr("href");   // direction = 클릭한 요소의 href 속성
    scrolling( direction ); // direction 을 인자로 함수 실행
    return false;   // 본래 이벤트 방지 
});


