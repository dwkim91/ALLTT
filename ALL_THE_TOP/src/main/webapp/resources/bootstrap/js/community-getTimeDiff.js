function elapsedTime(date) {
    const formattedDate = date.replace("KST", "").trim();
    const start = new Date(formattedDate);
    const end = new Date();
  
    const timeDiffMillis = end - start;
    const timeDiffSeconds = timeDiffMillis / 1000;
    const timeDiffMinutes = timeDiffSeconds / 60;
    const timeDiffHours = timeDiffMinutes / 60;
    const timeDiffDays = timeDiffHours / 24;
    const timeDiffMonths = timeDiffDays / 30.436875; // Approximate months
    const timeDiffYears = timeDiffMonths / 12;
    
    if (timeDiffMinutes < 1) {
      return "방금 전";
    } else if (timeDiffHours < 1) {
      return Math.floor(timeDiffMinutes) + "분 전";
    } else if (timeDiffDays < 1) {
      return Math.floor(timeDiffHours) + "시간 전";
    } else if (timeDiffDays < 30.436875) {
      return Math.floor(timeDiffDays) + "일 전";
    } else if (timeDiffMonths < 12) {
      return Math.floor(timeDiffMonths) + "달 전";
    } else {
      return Math.floor(timeDiffYears) + "년 전";
    }
}