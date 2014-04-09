# encoding: utf-8
#
# == License:
# Fairnopoly - Fairnopoly is an open-source online marketplace.
# Copyright (C) 2013 Fairnopoly eG
#
# This file is part of Fairnopoly.
#
# Fairnopoly is free software: you can redistribute it and/or modify
# it under the terms of the GNU Affero General Public License as
# published by the Free Software Foundation, either version 3 of the
# License, or (at your option) any later version.
#
# Fairnopoly is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU Affero General Public License for more details.
#
# You should have received a copy of the GNU Affero General Public License
# along with Fairnopoly.  If not, see <http://www.gnu.org/licenses/>.
#
module CategorySeedData

  def seed_categories
    @categories = []
    local_to_remote_ids = {}
    remote_to_local_ids = {}
    Category.delete_all
    category_production_hash.each do |k,v|
      c  = Category.create(:name => v[:name] , view_columns: v[:view_columns])
      local_to_remote_ids[c.id] = k
      remote_to_local_ids[k] = c.id
    end
    Category.all.each {|c|  c.update_attributes(parent_id: remote_to_local_ids[category_production_hash[local_to_remote_ids[c.id]][:parent_id]]) }
    @categories = Category.all
  end

  def category_production_hash
    # To refresh run this on production:
    #  Category.order(:id).all.map { |c| puts "#{c.id} => {name: \"#{c.name}\", parent_id: #{c.parent_id || "nil" }, view_columns: #{c.view_columns} }," ; nil }
    # and copy&paste here
    # Dont forget to delete the last ","
    {
      1 => {name: "Technik", parent_id: nil, view_columns: 2 },
      2 => {name: "Elektronik", parent_id: 1, view_columns: 2 },
      3 => {name: "Fahrzeuge", parent_id: 1, view_columns: 2 },
      4 => {name: "Medien", parent_id: nil, view_columns: 2 },
      5 => {name: "Bekleidung", parent_id: nil, view_columns: 2 },
      6 => {name: "Möbel & Wohnen", parent_id: 103, view_columns: 2 },
      7 => {name: "Freizeit & Sport", parent_id: nil, view_columns: 2 },
      8 => {name: "Lebensmittel", parent_id: nil, view_columns: 2 },
      9 => {name: "Gesundheit & Pflege", parent_id: nil, view_columns: 2 },
      10 => {name: "Kunst & Sammeln", parent_id: nil, view_columns: 2 },
      11 => {name: "Sonstiges", parent_id: nil, view_columns: 2 },
      12 => {name: "Kinder & Baby", parent_id: nil, view_columns: 2 },
      13 => {name: "Auto", parent_id: 3, view_columns: 2 },
      14 => {name: "Motorrad", parent_id: 3, view_columns: 2 },
      15 => {name: "weitere/sonstige Fahrzeuge", parent_id: 3, view_columns: 2 },
      16 => {name: "Foto & Kamera", parent_id: 2, view_columns: 2 },
      17 => {name: "TV & Video", parent_id: 2, view_columns: 2 },
      18 => {name: "Audio & HiFi", parent_id: 2, view_columns: 2 },
      19 => {name: "PC, Netzwerk, Software", parent_id: 2, view_columns: 2 },
      20 => {name: "Handy & Telefon", parent_id: 2, view_columns: 2 },
      21 => {name: "Filme", parent_id: 4, view_columns: 2 },
      22 => {name: "Musik", parent_id: 4, view_columns: 2 },
      23 => {name: "VHS", parent_id: 21, view_columns: 2 },
      24 => {name: "DVD", parent_id: 21, view_columns: 2 },
      25 => {name: "Blu-ray", parent_id: 21, view_columns: 2 },
      26 => {name: "Vinyl", parent_id: 22, view_columns: 2 },
      27 => {name: "CD", parent_id: 22, view_columns: 2 },
      28 => {name: "weitere Formate", parent_id: 22, view_columns: 2 },
      31 => {name: "Männer", parent_id: 5, view_columns: 2 },
      32 => {name: "Frauen", parent_id: 5, view_columns: 2 },
      33 => {name: "Accessoires", parent_id: nil, view_columns: 2 },
      34 => {name: "Schuhe", parent_id: 5, view_columns: 2 },
      35 => {name: "Möbel", parent_id: 6, view_columns: 2 },
      36 => {name: "Elektrogroß- & Haushaltsgeräte", parent_id: 110, view_columns: 2 },
      37 => {name: "Bekleidung", parent_id: 12, view_columns: 2 },
      38 => {name: "Spielzeug", parent_id: 12, view_columns: 2 },
      39 => {name: "Ausstattung", parent_id: 12, view_columns: 2 },
      40 => {name: "Reise", parent_id: 7, view_columns: 2 },
      41 => {name: "Sport", parent_id: 7, view_columns: 2 },
      42 => {name: "Essen", parent_id: 8, view_columns: 2 },
      43 => {name: "Getränke", parent_id: 8, view_columns: 2 },
      44 => {name: "Kaffee & Tee", parent_id: 8, view_columns: 2 },
      45 => {name: "Körperpflege", parent_id: 9, view_columns: 2 },
      46 => {name: "Kosmetik", parent_id: 9, view_columns: 2 },
      47 => {name: "Sonstiges", parent_id: 9, view_columns: 2 },
      48 => {name: "Duschen & Baden", parent_id: 9, view_columns: 2 },
      49 => {name: "Kunst", parent_id: 10, view_columns: 2 },
      50 => {name: "Sammeln & Seltenes", parent_id: 10, view_columns: 2 },
      51 => {name: "Schmuck", parent_id: 33, view_columns: 2 },
      52 => {name: "Outdoor", parent_id: 7, view_columns: 2 },
      53 => {name: "Textilien", parent_id: 6, view_columns: 2 },
      54 => {name: "Süßigkeiten", parent_id: 8, view_columns: 2 },
      55 => {name: "Schuhe", parent_id: 12, view_columns: 2 },
      56 => {name: "Bücher", parent_id: nil, view_columns: 3 },
      57 => {name: "Hemden", parent_id: 31, view_columns: 2 },
      58 => {name: "Hosen", parent_id: 31, view_columns: 2 },
      59 => {name: "Jacken & Mäntel", parent_id: 31, view_columns: 2 },
      60 => {name: "Pullover", parent_id: 31, view_columns: 2 },
      61 => {name: "T-Shirts", parent_id: 31, view_columns: 2 },
      62 => {name: "Longsleeves", parent_id: 31, view_columns: 2 },
      63 => {name: "Unterwäsche", parent_id: 31, view_columns: 2 },
      65 => {name: "Weitere", parent_id: 31, view_columns: 2 },
      66 => {name: "Blusen & Tunikas", parent_id: 32, view_columns: 2 },
      67 => {name: "Hosen", parent_id: 32, view_columns: 2 },
      68 => {name: "Röcke & Kleider", parent_id: 32, view_columns: 2 },
      69 => {name: "Jacken & Mäntel", parent_id: 32, view_columns: 2 },
      70 => {name: "Pullover", parent_id: 32, view_columns: 2 },
      71 => {name: "T-Shirts & Tops", parent_id: 32, view_columns: 2 },
      72 => {name: "Longsleeves", parent_id: 32, view_columns: 2 },
      73 => {name: "Unterwäsche", parent_id: 32, view_columns: 2 },
      75 => {name: "Weitere", parent_id: 32, view_columns: 2 },
      76 => {name: "unisex", parent_id: 5, view_columns: 2 },
      77 => {name: "Hemden", parent_id: 76, view_columns: 2 },
      78 => {name: "T-Shirts", parent_id: 76, view_columns: 2 },
      79 => {name: "Jacken & Mäntel", parent_id: 76, view_columns: 2 },
      80 => {name: "Pullover", parent_id: 76, view_columns: 2 },
      81 => {name: "Hosen", parent_id: 76, view_columns: 2 },
      83 => {name: "Weitere", parent_id: 76, view_columns: 2 },
      84 => {name: "Musikinstrumente", parent_id: 7, view_columns: 2 },
      85 => {name: "Spiele", parent_id: 7, view_columns: 2 },
      86 => {name: "Gesellschaftsspiele", parent_id: 85, view_columns: 2 },
      87 => {name: "Brettspiele", parent_id: 85, view_columns: 2 },
      88 => {name: "Puzzles", parent_id: 85, view_columns: 2 },
      89 => {name: "Draußen", parent_id: 85, view_columns: 2 },
      90 => {name: "Basteln & Selbermachen", parent_id: 7, view_columns: 2 },
      91 => {name: "Material", parent_id: 90, view_columns: 2 },
      92 => {name: "Anleitungen", parent_id: 90, view_columns: 2 },
      93 => {name: "Honig & Konfitüre", parent_id: 8, view_columns: 2 },
      94 => {name: "Gewürze", parent_id: 8, view_columns: 2 },
      95 => {name: "Öl & Essig", parent_id: 8, view_columns: 2 },
      96 => {name: "Fotografien", parent_id: 10, view_columns: 2 },
      97 => {name: "Laptop & Tablet", parent_id: 2, view_columns: 2 },
      98 => {name: "Laptopzubehör", parent_id: 2, view_columns: 2 },
      99 => {name: "Drucker", parent_id: 2, view_columns: 2 },
      100 => {name: "Computerspiele", parent_id: 4, view_columns: 2 },
      101 => {name: "PC", parent_id: 100, view_columns: 2 },
      102 => {name: "Konsole", parent_id: 100, view_columns: 2 },
      103 => {name: "Haus & Garten", parent_id: nil, view_columns: 2 },
      104 => {name: "Heimwerken", parent_id: 103, view_columns: 2 },
      105 => {name: "Garten", parent_id: 103, view_columns: 2 },
      106 => {name: "Haustierbedarf", parent_id: 103, view_columns: 2 },
      107 => {name: "Büro & Schreibwaren", parent_id: 103, view_columns: 2 },
      108 => {name: "Papier-, Büro- & Schreibwaren", parent_id: 107, view_columns: 2 },
      109 => {name: "Schulbedarf", parent_id: 107, view_columns: 2 },
      110 => {name: "Küche & Haushalt", parent_id: 6, view_columns: 2 },
      111 => {name: "Sachbücher", parent_id: 56, view_columns: 2 },
      112 => {name: "Romane & Erzählungen", parent_id: 56, view_columns: 2 },
      113 => {name: "Kinder- & Jugendbücher", parent_id: 56, view_columns: 2 },
      114 => {name: "Comics & Manga", parent_id: 56, view_columns: 2 },
      115 => {name: "Krimis & Thriller", parent_id: 56, view_columns: 2 },
      116 => {name: "eBooks", parent_id: 56, view_columns: 2 },
      117 => {name: "Hörbücher", parent_id: 56, view_columns: 2 },
      118 => {name: "Taschen", parent_id: 33, view_columns: 2 },
      119 => {name: "Tücher & Schals", parent_id: 33, view_columns: 2 },
      120 => {name: "Mützen & Handschuhe", parent_id: 33, view_columns: 2 },
      121 => {name: "Gürtel", parent_id: 33, view_columns: 2 },
      122 => {name: "Weitere", parent_id: 33, view_columns: 2 },
      123 => {name: "Uhren", parent_id: 33, view_columns: 2 },
      124 => {name: "Kleingeräte Haushalt", parent_id: 110, view_columns: 2 },
      125 => {name: "Glas & Porzellan", parent_id: 110, view_columns: 2 },
      126 => {name: "Badezimmer", parent_id: 6, view_columns: 2 },
      127 => {name: "Spiegel", parent_id: 6, view_columns: 2 },
      128 => {name: "Lampen", parent_id: 6, view_columns: 2 },
      129 => {name: "Dekoration", parent_id: 6, view_columns: 2 },
      130 => {name: "Antiquitäten", parent_id: 10, view_columns: 2 },
      131 => {name: "Für Frauen", parent_id: 34, view_columns: 2 },
      132 => {name: "Für Männer", parent_id: 34, view_columns: 2 },
      133 => {name: "Für unisex", parent_id: 34, view_columns: 2 },
      134 => {name: "Computerzubehör", parent_id: 2, view_columns: 2 },
      135 => {name: "Smartphone", parent_id: 20, view_columns: 2 },
      136 => {name: "Handy", parent_id: 20, view_columns: 2 },
      137 => {name: "Festnetztelefonie", parent_id: 20, view_columns: 2 },
      138 => {name: "Zubehör", parent_id: 20, view_columns: 2 },
      139 => {name: "Raritäten", parent_id: 26, view_columns: 2 },
      140 => {name: "Jazz", parent_id: 26, view_columns: 2 },
      141 => {name: "Klassik", parent_id: 26, view_columns: 2 },
      142 => {name: "Pop", parent_id: 26, view_columns: 2 },
      143 => {name: "Soundtrack", parent_id: 26, view_columns: 2 },
      144 => {name: "Electronic", parent_id: 26, view_columns: 2 },
      145 => {name: "Hip Hop/Rap", parent_id: 26, view_columns: 2 },
      146 => {name: "Rock", parent_id: 26, view_columns: 2 },
      147 => {name: "Alternative", parent_id: 26, view_columns: 2 },
      148 => {name: "Indie", parent_id: 26, view_columns: 2 },
      149 => {name: "Blues", parent_id: 26, view_columns: 2 },
      150 => {name: "Soul/R&B", parent_id: 26, view_columns: 2 },
      151 => {name: "Folk", parent_id: 26, view_columns: 2 },
      152 => {name: "Kindermusik&Hörspiele", parent_id: 26, view_columns: 2 },
      153 => {name: "Weihnachten", parent_id: 26, view_columns: 2 },
      154 => {name: "Sonstige", parent_id: 26, view_columns: 2 },
      155 => {name: "Alternative", parent_id: 27, view_columns: 2 },
      156 => {name: "Rock", parent_id: 27, view_columns: 2 },
      157 => {name: "Indie", parent_id: 27, view_columns: 2 },
      158 => {name: "Pop", parent_id: 27, view_columns: 2 },
      159 => {name: "Singer/Songwriter", parent_id: 27, view_columns: 2 },
      160 => {name: "Soundtrack", parent_id: 27, view_columns: 2 },
      161 => {name: "Klassik", parent_id: 27, view_columns: 2 },
      162 => {name: "Jazz", parent_id: 27, view_columns: 2 },
      163 => {name: "Electronic", parent_id: 27, view_columns: 2 },
      164 => {name: "Hip Hop/Rap", parent_id: 27, view_columns: 2 },
      165 => {name: "Soul/R&B", parent_id: 27, view_columns: 2 },
      166 => {name: "Folk", parent_id: 27, view_columns: 2 },
      167 => {name: "Weltmusik", parent_id: 27, view_columns: 2 },
      168 => {name: "Kindermusik&Hörspiele", parent_id: 27, view_columns: 2 },
      169 => {name: "Weihnachten", parent_id: 27, view_columns: 2 },
      170 => {name: "Sonstige", parent_id: 27, view_columns: 2 },
      171 => {name: "Ansichtskarten", parent_id: 50, view_columns: 2 },
      172 => {name: "Afrika", parent_id: 171, view_columns: 2 },
      173 => {name: "Asien", parent_id: 171, view_columns: 2 },
      174 => {name: "Australien", parent_id: 171, view_columns: 2 },
      175 => {name: "Europa", parent_id: 171, view_columns: 2 },
      176 => {name: "Amerika", parent_id: 171, view_columns: 2 },
      177 => {name: "Bauwerke", parent_id: 171, view_columns: 2 },
      178 => {name: "Sonstige Motive", parent_id: 171, view_columns: 2 },
      179 => {name: "Gutscheine", parent_id: nil, view_columns: 2 },
      180 => {name: "Biografien", parent_id: 56, view_columns: 2 },
      181 => {name: "Fantasy", parent_id: 56, view_columns: 2 },
      182 => {name: "Science Fiction", parent_id: 56, view_columns: 2 },
      183 => {name: "Kochbücher & Ernährung", parent_id: 56, view_columns: 2 },
      184 => {name: "Reise", parent_id: 56, view_columns: 2 },
      185 => {name: "Freizeit, Hobby, Natur", parent_id: 56, view_columns: 2 },
      186 => {name: "Ratgeber", parent_id: 56, view_columns: 2 },
      187 => {name: "Film, Kunst & Kultur", parent_id: 56, view_columns: 2 },
      188 => {name: "Körper, Geist, Seele", parent_id: 56, view_columns: 2 },
      189 => {name: "Fachbücher", parent_id: 56, view_columns: 2 },
      190 => {name: "Schule & Lernen", parent_id: 56, view_columns: 2 },
      191 => {name: "Computer & Internet", parent_id: 56, view_columns: 2 },
      192 => {name: "Business & Karriere", parent_id: 56, view_columns: 2 },
      193 => {name: "Erotik", parent_id: 56, view_columns: 2 },
      194 => {name: "Historische Romane", parent_id: 112, view_columns: 2 },
      195 => {name: "Kurzgeschichten", parent_id: 112, view_columns: 2 },
      196 => {name: "Gedichte & Drama", parent_id: 112, view_columns: 2 },
      197 => {name: "Märchen & Sagen", parent_id: 112, view_columns: 2 },
      198 => {name: "Serien & Reihen", parent_id: 112, view_columns: 2 },
      199 => {name: "Liebesromane", parent_id: 112, view_columns: 2 },
      200 => {name: "Anthologien", parent_id: 112, view_columns: 2 },
      201 => {name: "Humor & Satire", parent_id: 112, view_columns: 2 },
      202 => {name: "Gesamtausgaben", parent_id: 112, view_columns: 2 },
      203 => {name: "Tagebücher", parent_id: 112, view_columns: 2 },
      204 => {name: "Politik", parent_id: 180, view_columns: 2 },
      205 => {name: "Literatur", parent_id: 180, view_columns: 2 },
      206 => {name: "Film & Fernsehen", parent_id: 180, view_columns: 2 },
      207 => {name: "Kunst", parent_id: 180, view_columns: 2 },
      208 => {name: "Musik", parent_id: 180, view_columns: 2 },
      209 => {name: "Wirtschaft", parent_id: 180, view_columns: 2 },
      210 => {name: "Sport", parent_id: 180, view_columns: 2 },
      211 => {name: "Historische Krimis", parent_id: 115, view_columns: 2 },
      212 => {name: "Regionalkrimis", parent_id: 115, view_columns: 2 },
      213 => {name: "Thriller", parent_id: 115, view_columns: 2 },
      214 => {name: "Anthologien", parent_id: 115, view_columns: 2 },
      215 => {name: "Jugendbücher", parent_id: 113, view_columns: 2 },
      216 => {name: "Kinderbücher", parent_id: 113, view_columns: 2 },
      217 => {name: "Leseanfänger", parent_id: 113, view_columns: 2 },
      218 => {name: "Bilderbücher", parent_id: 113, view_columns: 2 },
      219 => {name: "Cartoons", parent_id: 114, view_columns: 2 },
      220 => {name: "Comics", parent_id: 114, view_columns: 2 },
      221 => {name: "Graphic Novels", parent_id: 114, view_columns: 2 },
      222 => {name: "Manga", parent_id: 114, view_columns: 2 },
      223 => {name: "Vegetarisch & Vegan", parent_id: 183, view_columns: 2 },
      224 => {name: "Backen", parent_id: 183, view_columns: 2 },
      225 => {name: "Grundkochbücher", parent_id: 183, view_columns: 2 },
      226 => {name: "Vollwertküche", parent_id: 183, view_columns: 2 },
      227 => {name: "Star-Köche", parent_id: 183, view_columns: 2 },
      228 => {name: "Länderküche", parent_id: 183, view_columns: 2 },
      229 => {name: "Party & Picknick", parent_id: 183, view_columns: 2 },
      230 => {name: "Schnelle Küche", parent_id: 183, view_columns: 2 },
      231 => {name: "Feinschmecker", parent_id: 183, view_columns: 2 },
      232 => {name: "Koch-Lexika", parent_id: 183, view_columns: 2 },
      233 => {name: "Für Babys und Kinder", parent_id: 183, view_columns: 2 },
      234 => {name: "Desserts", parent_id: 183, view_columns: 2 },
      235 => {name: "Karten & Atlanten", parent_id: 184, view_columns: 2 },
      236 => {name: "Radreisen & Radtouren", parent_id: 184, view_columns: 2 },
      237 => {name: "Reiseführer", parent_id: 184, view_columns: 2 },
      238 => {name: "Reiseberichte", parent_id: 184, view_columns: 2 },
      239 => {name: "Camping", parent_id: 184, view_columns: 2 },
      240 => {name: "Wandern", parent_id: 184, view_columns: 2 },
      241 => {name: "Bildbände", parent_id: 184, view_columns: 2 },
      242 => {name: "Basteln & Handarbeiten", parent_id: 185, view_columns: 2 },
      243 => {name: "Garten & Natur", parent_id: 185, view_columns: 2 },
      244 => {name: "Heimwerken", parent_id: 185, view_columns: 2 },
      245 => {name: "Sport & Fitness", parent_id: 185, view_columns: 2 },
      246 => {name: "Tierhaltung", parent_id: 185, view_columns: 2 },
      248 => {name: "Bildbände", parent_id: 185, view_columns: 2 },
      249 => {name: "Architektur", parent_id: 187, view_columns: 2 },
      250 => {name: "Bildende Kunst", parent_id: 187, view_columns: 2 },
      251 => {name: "Design", parent_id: 187, view_columns: 2 },
      252 => {name: "Bildbände", parent_id: 187, view_columns: 2 },
      253 => {name: "Film & Fernsehen", parent_id: 187, view_columns: 2 },
      254 => {name: "Photographie", parent_id: 187, view_columns: 2 },
      255 => {name: "Mode", parent_id: 187, view_columns: 2 },
      256 => {name: "Musik", parent_id: 187, view_columns: 2 },
      257 => {name: "Theater", parent_id: 187, view_columns: 2 },
      258 => {name: "Geschichte", parent_id: 111, view_columns: 2 },
      259 => {name: "Klima & Ökologie", parent_id: 111, view_columns: 2 },
      260 => {name: "Naturwissenschaften", parent_id: 111, view_columns: 2 },
      261 => {name: "Politik & Gesellschaft", parent_id: 111, view_columns: 2 },
      262 => {name: "Religion & Glaube", parent_id: 111, view_columns: 2 },
      263 => {name: "Wirtschaft & Finanzwesen", parent_id: 111, view_columns: 2 },
      264 => {name: "Wörterbücher & Lexika", parent_id: 111, view_columns: 2 },
      265 => {name: "Eltern & Kinder", parent_id: 186, view_columns: 2 },
      266 => {name: "Ernährung & Diät", parent_id: 186, view_columns: 2 },
      267 => {name: "Einkaufsführer", parent_id: 186, view_columns: 2 },
      268 => {name: "Gesundheit", parent_id: 186, view_columns: 2 },
      269 => {name: "Lebenshilfe", parent_id: 186, view_columns: 2 },
      270 => {name: "Auto & Verkehr", parent_id: 186, view_columns: 2 },
      271 => {name: "Geld & Finanzen", parent_id: 186, view_columns: 2 },
      272 => {name: "Partnerschaft", parent_id: 186, view_columns: 2 },
      273 => {name: "Rechtsratgeber", parent_id: 186, view_columns: 2 },
      274 => {name: "Astrologie & Sternzeichen", parent_id: 188, view_columns: 2 },
      275 => {name: "Meditation & Yoga", parent_id: 188, view_columns: 2 },
      276 => {name: "Natur & Steine", parent_id: 188, view_columns: 2 },
      277 => {name: "Lehren & Richtungen", parent_id: 188, view_columns: 2 },
      278 => {name: "Energie & Kosmos", parent_id: 188, view_columns: 2 },
      279 => {name: "Tarot & Orakel", parent_id: 188, view_columns: 2 },
      280 => {name: "Engel", parent_id: 188, view_columns: 2 },
      281 => {name: "Wunscherfüllung", parent_id: 188, view_columns: 2 },
      282 => {name: "Architektur", parent_id: 189, view_columns: 2 },
      283 => {name: "Biologie", parent_id: 189, view_columns: 2 },
      284 => {name: "Chemie", parent_id: 189, view_columns: 2 },
      285 => {name: "Didaktik", parent_id: 189, view_columns: 2 },
      286 => {name: "Geowissenschaft", parent_id: 189, view_columns: 2 },
      287 => {name: "Geschichte", parent_id: 189, view_columns: 2 },
      288 => {name: "Informatik", parent_id: 189, view_columns: 2 },
      289 => {name: "Ingenieurwissenschaft", parent_id: 189, view_columns: 2 },
      290 => {name: "Jura", parent_id: 189, view_columns: 2 },
      291 => {name: "Kunst", parent_id: 189, view_columns: 2 },
      292 => {name: "Literaturwissenschaft", parent_id: 189, view_columns: 2 },
      293 => {name: "Mathematik", parent_id: 189, view_columns: 2 },
      294 => {name: "Medienwissenschaft", parent_id: 189, view_columns: 2 },
      295 => {name: "Medizin", parent_id: 189, view_columns: 2 },
      296 => {name: "Musikwissenschaft", parent_id: 189, view_columns: 2 },
      297 => {name: "Pädagogik", parent_id: 189, view_columns: 2 },
      298 => {name: "Philosophie", parent_id: 189, view_columns: 2 },
      299 => {name: "Physik & Astronomie", parent_id: 189, view_columns: 2 },
      300 => {name: "Politikwissenschaft", parent_id: 189, view_columns: 2 },
      301 => {name: "Psychologie", parent_id: 189, view_columns: 2 },
      302 => {name: "Soziologie", parent_id: 189, view_columns: 2 },
      303 => {name: "Sprachwissenschaft", parent_id: 189, view_columns: 2 },
      304 => {name: "Technik", parent_id: 189, view_columns: 2 },
      305 => {name: "Theologie", parent_id: 189, view_columns: 2 },
      306 => {name: "Umweltwissenschaft", parent_id: 189, view_columns: 2 },
      307 => {name: "Wirtschaft", parent_id: 189, view_columns: 2 },
      308 => {name: "Sprachen & Wörterbücher", parent_id: 190, view_columns: 2 },
      309 => {name: "Schulbücher", parent_id: 190, view_columns: 2 },
      310 => {name: "Schullektüren", parent_id: 190, view_columns: 2 },
      311 => {name: "Lernhilfen", parent_id: 190, view_columns: 2 },
      312 => {name: "Lehrer", parent_id: 190, view_columns: 2 },
      313 => {name: "Erwachsenenbildung", parent_id: 190, view_columns: 2 },
      314 => {name: "Applikation & Software", parent_id: 191, view_columns: 2 },
      315 => {name: "Betriebssysteme", parent_id: 191, view_columns: 2 },
      316 => {name: "Datenbanken", parent_id: 191, view_columns: 2 },
      317 => {name: "Games", parent_id: 191, view_columns: 2 },
      318 => {name: "Grafik & Design", parent_id: 191, view_columns: 2 },
      319 => {name: "Hardware", parent_id: 191, view_columns: 2 },
      320 => {name: "Internet", parent_id: 191, view_columns: 2 },
      321 => {name: "Künstliche Intelligenz", parent_id: 191, view_columns: 2 },
      322 => {name: "Multimedia", parent_id: 191, view_columns: 2 },
      323 => {name: "Netzwerke", parent_id: 191, view_columns: 2 },
      324 => {name: "Programmierung", parent_id: 191, view_columns: 2 },
      325 => {name: "Sicherheit", parent_id: 191, view_columns: 2 },
      326 => {name: "Zertifizierung", parent_id: 191, view_columns: 2 },
      327 => {name: "Bewerbung", parent_id: 192, view_columns: 2 },
      328 => {name: "Job & Karriere", parent_id: 192, view_columns: 2 },
      329 => {name: "Kommunikation", parent_id: 192, view_columns: 2 },
      330 => {name: "Management", parent_id: 192, view_columns: 2 },
      331 => {name: "Mitarbeiterführung", parent_id: 192, view_columns: 2 },
      332 => {name: "Unternehmensführung", parent_id: 192, view_columns: 2 },
      333 => {name: "Ratgeber", parent_id: 193, view_columns: 2 },
      334 => {name: "Romane & Erzählungen", parent_id: 193, view_columns: 2 },
      335 => {name: "Kamasutra", parent_id: 193, view_columns: 2 },
      336 => {name: "Bildbände", parent_id: 193, view_columns: 2 },
      337 => {name: "eBook-Reader", parent_id: 56, view_columns: 2 },
      338 => {name: "Romane & Erzählungen", parent_id: 116, view_columns: 2 },
      339 => {name: "Krimis & Thriller", parent_id: 116, view_columns: 2 },
      340 => {name: "Biografien", parent_id: 116, view_columns: 2 },
      341 => {name: "Fantasy", parent_id: 116, view_columns: 2 },
      342 => {name: "Science Fiction", parent_id: 116, view_columns: 2 },
      343 => {name: "Ratgeber", parent_id: 116, view_columns: 2 },
      344 => {name: "Sachbücher", parent_id: 116, view_columns: 2 },
      345 => {name: "Fachbücher", parent_id: 116, view_columns: 2 },
      346 => {name: "Romane & Erzählungen", parent_id: 117, view_columns: 2 },
      347 => {name: "Krimis & Thriller", parent_id: 117, view_columns: 2 },
      348 => {name: "Biografien", parent_id: 117, view_columns: 2 },
      349 => {name: "Fantasy", parent_id: 117, view_columns: 2 },
      350 => {name: "Science Fiction", parent_id: 117, view_columns: 2 },
      351 => {name: "Ratgeber", parent_id: 117, view_columns: 2 },
      352 => {name: "Sachbücher", parent_id: 117, view_columns: 2 },
      353 => {name: "Kinder- & Jugendbücher", parent_id: 117, view_columns: 2 },
      354 => {name: "Kinder- & Jugendbücher", parent_id: 116, view_columns: 2 },
      357 => {name: "Dienstleistungen", parent_id: nil, view_columns: 2 },
      358 => {name: "Betreuung & Pflege", parent_id: 357, view_columns: 2 },
      359 => {name: "Beratung & Coaching", parent_id: 357, view_columns: 2 },
      360 => {name: "Gastronomie & Events", parent_id: 357, view_columns: 2 },
      361 => {name: "Gartenarbeiten", parent_id: 357, view_columns: 2 },
      362 => {name: "Gebäudedienstleistungen", parent_id: 357, view_columns: 2 },
      363 => {name: "Handwerkerdienstleistungen", parent_id: 357, view_columns: 2 },
      364 => {name: " Computer & Internet", parent_id: 357, view_columns: 2 },
      365 => {name: "Marketing", parent_id: 357, view_columns: 2 },
      366 => {name: "Schulungen & Seminare", parent_id: 357, view_columns: 2 },
      367 => {name: "Tierpflege", parent_id: 357, view_columns: 2 },
      368 => {name: "Umzüge & Transport", parent_id: 357, view_columns: 2 },
      369 => {name: "Bücherpaket", parent_id: 56, view_columns: 2 }

    }
  end
end