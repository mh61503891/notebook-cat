require 'spec_helper'

RSpec.describe NotebookCat::Memo do

  let :memo do
    NotebookCat::Memo.read('spec/fixtures/test.md')
  end

  it '#urls' do
    expect(memo.urls.size).to eq 2
  end

  it '#block_codes' do
    expect(memo.block_codes.size).to eq 2
  end

end
