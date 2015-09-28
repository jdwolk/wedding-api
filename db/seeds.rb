admin = FactoryGirl.create(:admin)
admin_inviter = Presenter.present(admin, roles: [Inviter])

guest1 = FactoryGirl.build(:guest, passcode: 'ABC123')
admin_inviter.invite!(guest1)

Inviting::Granter.grant(2).invites.to(guest1)
guest1.save!
