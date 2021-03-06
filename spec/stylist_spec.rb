require('spec_helper')

describe(Stylist) do

  describe "#name" do
    it "returns the name of the stylist" do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      expect(stylist1.name).to eq('Buffy Summers')
    end
  end

  describe ".all" do
    it 'is an empty array at first' do
      expect(Stylist.all).to eq([])
    end
  end

  describe "#save" do
    it 'save a stylist to the list of stylists' do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      stylist2 = Stylist.new({:id => nil, :name => 'Lara Croft'})
      stylist2.save
      expect(Stylist.all).to eq([stylist1, stylist2])
    end
  end

  describe "#==" do
    it 'will determine if a stylist is equal to another stylist based on its name and id' do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      stylist2 = Stylist.new({:id => nil, :name => 'Lara Croft'})
      stylist2.save
      expect(Stylist.all).to eq([stylist1, stylist2])
    end
  end

  describe "#delete_stylist" do
    it 'deletes a stylist from the list of stylists' do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      stylist2 = Stylist.new({:id => nil, :name => 'Lara Croft'})
      stylist2.save
      stylist3 = Stylist.new({:id => nil, :name => 'Leslie Knope'})
      stylist3.save
      stylist2.delete_stylist
      expect(Stylist.all).to eq([stylist1, stylist3])
    end
  end

  describe '#update' do
    it 'updates the name of a stylist' do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      stylist1.update(:name => 'Valentine Wiggins')
      expect(stylist1.name).to eq('Valentine Wiggins')
    end
  end

  describe ".find" do
    it "finds a stylist by id number" do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      stylist2 = Stylist.new({:id => nil, :name => 'Lara Croft'})
      stylist2.save
      stylist3 = Stylist.new({:id => nil, :name => 'Leslie Knope'})
      stylist3.save
      expect(Stylist.find(stylist2.id)).to eq(stylist2)
    end
  end

  describe "#all_clients" do
    it 'lists all the clients of a stylist' do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      client1 = Client.new({:id => nil, :name => 'Arya Stark', :stylist_id => stylist1.id})
      client1.save
      client2 = Client.new({:id => nil, :name => 'Sansa Stark', :stylist_id => stylist1.id})
      client2.save
      client3 = Client.new({:id => nil, :name => 'Bran Stark', :stylist_id => stylist1.id})
      client3.save
      expect(stylist1.all_clients).to eq([client1, client2, client3])
    end
  end

  describe "#find_client" do
    it 'returns a specific client from a specific stylist' do
      stylist1 = Stylist.new({:id => nil, :name => 'Buffy Summers'})
      stylist1.save
      client1 = Client.new({:id => nil, :name => 'Arya Stark', :stylist_id => stylist1.id})
      client1.save
      client2 = Client.new({:id => nil, :name => 'Sansa Stark', :stylist_id => stylist1.id})
      client2.save
      client3 = Client.new({:id => nil, :name => 'Bran Stark', :stylist_id => stylist1.id})
      client3.save
      expect(stylist1.find_client(client2.name)).to eq(client2)
    end
  end


end
