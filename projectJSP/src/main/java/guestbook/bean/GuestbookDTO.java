package guestbook.bean;

import java.util.Date;


public class GuestbookDTO {
    private int seq;
    private String writer;
    private String email;
    private String homepage;
    private String title;
    private String content;
    private Date logtime;

    public int getSeq() {
        return seq;
    }

    public void setSeq(int seq) {
        this.seq = seq;
    }

    public String getWriter() {
        return writer;
    }

    public void setWriter(String writer) {
        this.writer = writer;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getHomepage() {
        return homepage;
    }

    public void setHomepage(String homepage) {
        this.homepage = homepage;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Date getLogtime() {
        return logtime;
    }

    public void setLogtime(Date logtime) {
        this.logtime = logtime;
    }

    @Override
    public String toString() {
        return "GuestbookDTO [seq=" + seq + ", writer=" + writer + ", email=" + email + ", homepage=" + homepage
                + ", title=" + title + ", content=" + content + ", logtime=" + logtime + "]";
    }
}
