package vn.hoidanit.laptopshop.domain;

import jakarta.persistence.*;
import vn.hoidanit.laptopshop.domain.User;

import java.sql.Timestamp;
import java.util.Calendar;
import java.util.Date;

@Entity
public class PasswordResetToken {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    private String token;

    @OneToOne(targetEntity = User.class, fetch = FetchType.EAGER)
    @JoinColumn(nullable = false, name = "user_id")
    private User user;

    private Date expiryDate;

    public PasswordResetToken(String token, User user){
        this.token = token;
        this.user = user;
        this.expiryDate = calculateExpiryDate(30);
    }

    private Date calculateExpiryDate(int expriryTimeInMinutes){
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(new Timestamp(calendar.getTime().getTime()));
        calendar.add(Calendar.MINUTE, expriryTimeInMinutes);
        return new Date(calendar.getTime().getTime());
    }


    public boolean isExpired() {
        return false;
    }

    public User getUser() {
        return null;
    }
}