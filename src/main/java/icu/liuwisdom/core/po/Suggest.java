package icu.liuwisdom.core.po;

import java.util.Date;

/*建议POJO*/
public class Suggest {
    private Integer id;//建议id
    private Date time;//发布时间
    private String content;//建议内容
    private String proposer;//建议者
    private Integer start;            // 起始行
    private Integer rows;             // 所取行数

    public Integer getStart() {
        return start;
    }

    public void setStart(Integer start) {
        this.start = start;
    }

    public Integer getRows() {
        return rows;
    }

    public void setRows(Integer rows) {
        this.rows = rows;
    }

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getTime() {
        return time;
    }

    public void setTime(Date time) {
        this.time = time;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public String getProposer() {
        return proposer;
    }

    public void setProposer(String proposer) {
        this.proposer = proposer;
    }

    @Override
    public String toString() {
        return "Suggest{" +
                "id=" + id +
                ", time=" + time +
                ", content='" + content + '\'' +
                ", proposer='" + proposer + '\'' +
                ", start=" + start +
                ", rows=" + rows +
                '}';
    }
}
