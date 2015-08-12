module AsciiArtHelper
  def self.generate_ascii(url:, color:, width:, indent_depth:, border:)
    ascii = AsciiArt.new(url).to_ascii_art(color: color, width: width)

    ascii = remove_border(ascii) unless border

    ascii = indent(ascii: ascii, indent_depth: indent_depth) if indent_depth

    ascii
  end

  def self.remove_border(ascii)
    ascii.gsub(/\|\n/, "\n").gsub(/\n\|/, "\n").gsub(/\+-+\+/, "\n")
  end

  def self.indent(ascii:, indent_depth:)
    ascii.gsub(/\n/, "\n#{"\t" * indent_depth}")
  end
end
