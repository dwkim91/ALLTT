//CSRF 토큰 가져오기 (페이지 로딩 시 한 번만 수행)
var csrfToken = $("meta[name='X-CSRF-TOKEN']").attr("content"); // CSRF 토큰 값 추출