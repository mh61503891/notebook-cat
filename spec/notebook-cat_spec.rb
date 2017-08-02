require 'spec_helper'

RSpec.describe NotebookCat do
  it '#version' do
    expect(NotebookCat::VERSION).not_to be nil
  end
end
