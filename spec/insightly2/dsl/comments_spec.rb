require 'spec_helper'

describe Insightly2::DSL::Comments do
  let(:comment_id) { 3469515 }

  # GET /v2.2/Comments/{id}
  describe '#get_comment' do
    it 'returns a comment' do
      VCR.use_cassette('get_comment') do
        expect(Insightly2.client.get_comment(id: comment_id)).to be_a(Comment)
      end
    end
  end

  # POST /v2.2/Comments?c_id={c_id}&filename={filename}
  describe '#create_comment_attachment' do
    it 'returns a response with code 201' do
      VCR.use_cassette('create_comment_attachment') do
        response = Insightly2.client.create_comment_attachment(id: comment_id, filename: '1.jpg')
        expect(response.status).to eq(201)
      end
    end
  end

  # PUT /v2.2/Comments
  describe '#update_comment' do
    it 'updates a comment' do
      VCR.use_cassette('update_comment') do
        comment = Insightly2.client.get_comment(id: comment_id)
        response = Insightly2.client.update_comment(comment: comment)
        expect(response).to be_a(Comment)
      end
    end
  end

  # DELETE /v2.2/Comments/{id}
  describe '#delete_comment' do
    it 'returns a response with code 202' do
      VCR.use_cassette('delete_comment') do
        response = Insightly2.client.delete_comment(id: comment_id)
        expect(response.status).to eq(202)
      end
    end
  end
end
