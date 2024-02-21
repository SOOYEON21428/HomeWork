package board.bean;


public class BoardDTO {
   
   private int seq;
   private String id;
   private String name;
   private String email;
   private String subject;
   private String content;
   
   private int ref;  // 그룹번
   private int lev;  // 단계
   public int getSeq() {
	return seq;
}
public void setSeq(int seq) {
	this.seq = seq;
}
public String getId() {
	return id;
}
public void setId(String id) {
	this.id = id;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getEmail() {
	return email;
}
public void setEmail(String email) {
	this.email = email;
}
public String getSubject() {
	return subject;
}
public void setSubject(String subject) {
	this.subject = subject;
}
public String getContent() {
	return content;
}
public void setContent(String content) {
	this.content = content;
}
public int getRef() {
	return ref;
}
public void setRef(int ref) {
	this.ref = ref;
}
public int getLev() {
	return lev;
}
public void setLev(int lev) {
	this.lev = lev;
}
public int getStep() {
	return step;
}
public void setStep(int step) {
	this.step = step;
}
public int getPseq() {
	return pseq;
}
public void setPseq(int pseq) {
	this.pseq = pseq;
}
public int getReply() {
	return reply;
}
public void setReply(int reply) {
	this.reply = reply;
}
public int getHit() {
	return hit;
}
public void setHit(int hit) {
	this.hit = hit;
}
public String getLogtime() {
	return logtime;
}
public void setLogtime(String logtime) {
	this.logtime = logtime;
}
private int step;  // 글순서
   private int pseq;  // 원글번호
   private int reply;   // 답변수
   
   private int hit;  // 조회 수
   private String logtime;  // 시간
   
} // end class
