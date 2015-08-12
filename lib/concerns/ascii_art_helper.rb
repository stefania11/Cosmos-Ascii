module AsciiArtHelper
  def self.generate_ascii(src:,
                          color: true,
                          width: 50,
                          indent_depth: 2,
                          border: false)

    ascii = AsciiArt.new(src).to_ascii_art(color: color, width: width)

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
