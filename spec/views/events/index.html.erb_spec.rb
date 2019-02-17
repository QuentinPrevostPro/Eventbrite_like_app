require 'rails_helper'

RSpec.describe "events/index", type: :view do
  context 'it says welcome' do
    it "displays 'Bonjour'" do
      # génère la page
      render
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'Bonjour'
    end
  end
  
  context 'it lists gossips' do
    it "displays 'Voici la liste des événements:'" do
      # génère la page
      render
      # le contenu "Bievenue" doit être dans la page
      expect(rendered).to have_content 'Voici les événements organisés près de chez vous.'
    end
  end
end
