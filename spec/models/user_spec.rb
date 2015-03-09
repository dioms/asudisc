require 'spec_helper'
require 'rails_helper'

describe User do 

  context 'paid for one semester' do
    let(:user) { FactoryGirl.create(:user) }
    let(:payment) { FactoryGirl.create(:payment) }

    it 'has paid for current semester' do
      user = FactoryGirl.create(:user)
      payment = FactoryGirl.create(:payment)
      expect(user.currently_paid?).to be true
    end

    it 'hasnt paid for next semester' do
      user = FactoryGirl.create(:user)
      payment = FactoryGirl.create(:payment)
      Timecop.freeze(Date.today + 6.months) do
        expect(user.currently_paid?).to be false
      end
    end
  end

  context 'paid for a year' do

    it 'has paid for current semester' do
      user = FactoryGirl.create(:user)
      payment = FactoryGirl.create(:year_payment)
      expect(user.currently_paid?).to be true
    end

    it 'has paid for next semester' do
      user = FactoryGirl.create(:user)
      payment = FactoryGirl.create(:year_payment)
      Timecop.freeze(Date.today + 6.months) do
        expect(user.currently_paid?).to be true
      end
    end

    it 'hasnt paid for next year' do
      user = FactoryGirl.create(:user)
      payment = FactoryGirl.create(:year_payment)
      Timecop.freeze(Date.today + 12.months) do
        expect(user.currently_paid?).to be false
      end
    end
  end

end

