package edu.chunjae.dto;

// 배송
public class Delivery {

    private int dno;            // 배송코드
    private int sno;            // 결제번호
    private String cno;         // 고객아이디
    private String daddr;       // + 배송지
    private String custel;      // 고객연락처
    private String pcom;        // (admin) 배송회사
    private String ptel;        // (admin) 배송기사 연락처
    private String pstate;      // (0: 배송전, 1: 배송중, 2: 도착, 3: 구매결정) - 배송상태

    public int getDno() {
        return dno;
    }

    public void setDno(int dno) {
        this.dno = dno;
    }

    public int getSno() {
        return sno;
    }

    public void setSno(int sno) {
        this.sno = sno;
    }

    public String getCno() {
        return cno;
    }

    public void setCno(String cno) {
        this.cno = cno;
    }

    public String getDaddr() {
        return daddr;
    }

    public void setDaddr(String daddr) {
        this.daddr = daddr;
    }

    public String getCustel() {
        return custel;
    }

    public void setCustel(String custel) {
        this.custel = custel;
    }

    public String getPcom() {
        return pcom;
    }

    public void setPcom(String pcom) {
        this.pcom = pcom;
    }

    public String getPtel() {
        return ptel;
    }

    public void setPtel(String ptel) {
        this.ptel = ptel;
    }

    public String getPstate() {
        return pstate;
    }

    public void setPstate(String pstate) {
        this.pstate = pstate;
    }

    @Override
    public String toString() {
        return "Delivery{" +
                "dno=" + dno +
                ", sno=" + sno +
                ", cno='" + cno + '\'' +
                ", daddr='" + daddr + '\'' +
                ", custel='" + custel + '\'' +
                ", pcom='" + pcom + '\'' +
                ", ptel='" + ptel + '\'' +
                ", pstate='" + pstate + '\'' +
                '}';
    }
}
