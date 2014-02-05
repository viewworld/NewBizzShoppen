def without_confirmation_email!
  allow_any_instance_of(User).to receive(:send_confirmation_instructions).and_return(true)
end
