$('.css-xyumn.e10hkk356').click(function() {
    $.ajax({
      url: '/member/checkSession',
      type: 'POST',
      success: function(response) {
        if (response) {
          console.log('로그인 상태입니다.');
        } else {
          console.log('비로그인 상태입니다.');
        }
      },
      error: function(xhr, status, error) {
        console.log('세션 확인 중 오류가 발생했습니다:', error);
      }
    });
});