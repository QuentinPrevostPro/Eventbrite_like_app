class AttendanceMailer < ApplicationMailer
  default from: 'no-reply@example.com'

  def new_attendee_email(attendance)
    #on récupère le payment du nouveau participant
    @attendance = attendance

    #on récupère l'administrateur de l'événement
    @admin = @attendance.event.admin
    
    # c'est cet appel à mail() qui permet d'envoyer l’e-mail en définissant destinataire et sujet.
    mail(to: @admin.email, subject: 'Il y a un nouveau participant à votre événement') 
  end
end
