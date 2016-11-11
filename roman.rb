class Integer
  Roman = 'IVXLCDM'
  def to_roman
    raise "Number too large" if self > 4999
    n, nsize = self, Math.log10(self).to_i
    nsize.downto(0).map do |pow|
      mid = pow << 1
      current = n / (10 ** pow)
      n = n % (10 ** pow)
      mods = current % 5
      out = ''
      out << Roman[mid] if mods == 4
      out << Roman[mid + (current == 9 ? 2 : 1)] if current > 3
      out << (Roman[mid] * mods) if mods < 4
      out
    end.join
  end
end
