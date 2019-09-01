require 'takeaway'

describe Takeaway do
  it 'responds to show_menu' do
    expect(subject).to respond_to(:show_menu)
  end
  it 'responds to place_order' do
    expect(subject).to respond_to(:place_order)
  end
  describe '#show_menu' do
    it 'shows a list of dishes with prices' do
      expect(subject.show_menu).to eq(Takeaway::MENU)
    end
  end
  describe '#place_order' do
    let(:order) { double :order }
    let(:order_total) { double :order_total }
    let(:placed_order) { { order: order, order_total: order_total } }

    it 'selects some number of several available dishes' do
      takeaway = Takeaway.new
      takeaway.place_order(order, order_total)
      expect(takeaway.placed_order).to eq(placed_order)
    end
  end
end
