class ProposalMailer < ApplicationMailer

  def notify_of_turn_to_vote(user)
    @user = user
    mail(to: @user.email, subject: "LET'S - It's Your Turn to Vote!")
  end

  def notify_of_invitation(user)
    @user = user
    mail(to: @user.email, subject: "LET'S - You're Invited!")
  end

  def notify_of_final_decision(user, decision)
    @user = user
    @decision = decision
    mail(to: @user.email, subject: "LET'S - You've Reached a Decision!")
  end

  def notify_of_expired_time(user, decision)
    @user = user
    @decision = decision
    mail(to: @user.email, subject: "LET'S - You Missed Your Turn!")
  end

end
