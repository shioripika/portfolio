require 'test_helper'

class ContactMailerTest < ActionMailer::TestCase
  #メールの実装テスト    
  test "contact_mail" do
    contact = Contact.new(name: "Pika", email: "pikachu@example.com", message: "I love Satoshi!")
    mail = ContactMailer.contact_mail(contact)
    assert_equal "メールのタイトル", mail.subject
    assert_equal [ENV['MAIL']], mail.to
    assert_equal ["from@example.com"], mail.from
    assert_match contact.name, mail.body.encoded
  end
end