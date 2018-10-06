# Module that can be included (mixin) to take and output TSV data

module TsvBuddy
  # take_tsv: converts a String with TSV data into @data
  # parameter: tsv - a String in TSV format
  def rowToHash(headers, row)
    row.map.with_index { |value, i| [headers[i], value] }.to_h
  end 

  def take_tsv(tsv)
    rows = tsv.split("\n").map{
       |line| line.split("\t")
    }
    headers = rows[0]
    data = rows[1..-1]
    @data = data.map{|row| rowToHash(headers, row)} 

 
  end

  # to_tsv: converts @data into tsv string
  # returns: String in TSV format
  def to_tsv
    tsv = @data[0].keys.join("\t") + "\n"
    @data.map { |hash| tsv += hash.values.join("\t") + "\n" }
    tsv
  end
end


