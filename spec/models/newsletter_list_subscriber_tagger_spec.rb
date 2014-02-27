require 'spec_helper'

describe NewsletterListSubscriberTagger do
  it { should validate_presence_of(:current_user) }
  it { should validate_presence_of(:newsletter_list) }
  it { should validate_presence_of(:tags) }
  it { should ensure_inclusion_of(:type).in_array(NewsletterListSubscriberTagger::TYPES) }

  context 'newsletter_list_subscriber exists' do
    include_context 'newsletter list subscriber exists'

    describe '#save' do
      let(:subject) { NewsletterListSubscriberTagger.new(attributes) }
      let(:perform) { subject.save }

      context 'valid attributes' do
        let(:attributes) { {:current_user => call_centre,
                            :newsletter_list => newsletter_list,
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
            it { expect { perform }.to change { ActionMailer::Base.deliveries.count }.by(1) }
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
            it { expect { perform }.to change { ActionMailer::Base.deliveries.count }.by(1) }
          end
        end
      end

      context 'invalid attributes' do
        let(:attributes) { {} }

        its(:save) { should be_false }
        it { expect { perform }.not_to change { ActionMailer::Base.deliveries.count } }
      end
    end
  end
end
