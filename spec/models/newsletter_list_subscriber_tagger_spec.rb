require 'spec_helper'

describe NewsletterListSubscriberTagger do
  it { should validate_presence_of(:newsletter_list) }
  it { should validate_presence_of(:tags) }
  it { should ensure_inclusion_of(:type).in_array(NewsletterListSubscriberTagger::TYPES) }

  context 'newsletter_list_subscriber exists' do
    include_context 'email templates for campaign exists'
    let!(:contact) { create(:contact) }
    let!(:call_centre) { contact.campaign.creator }
    let!(:newsletter_list) { create(:newsletter_list, :owner => call_centre) }
    let!(:newsletter_list_subscriber) { create(:newsletter_list_subscriber,
                                               :newsletter_list => newsletter_list,
                                               :subscriber => contact) }

    describe '#save' do
      let(:subject) { NewsletterListSubscriberTagger.new(attributes) }

      context 'valid attributes' do
        let(:perform) { subject.save }
        let(:attributes) { {:newsletter_list => newsletter_list,
                            :tags => 'tag2, tag3',
                            :type => type} }

        context 'addition' do
          let(:type) { 'add' }

          its(:save) { should be_true }

          context 'contact has tag' do
            before do
              contact.tag_list.add('tag1')
              contact.save
            end

            it { expect { perform }.to change { contact.reload.tag_list.sort }.from(%w(tag1)).to(%w(tag1 tag2 tag3)) }
          end
        end

        context 'removal' do
          let(:type) { 'remove' }

          its(:save) { should be_true }

          context 'contact has tags' do
            before do
              contact.tag_list.add('tag1', 'tag2')
              contact.save
            end

            it { expect { perform }.to change { contact.reload.tag_list.sort }.from(%w(tag1 tag2)).to(%w(tag1)) }
          end
        end
      end

      context 'invalid attributes' do
        let(:attributes) { {} }

        its(:save) { should be_false }
      end
    end
  end
end
