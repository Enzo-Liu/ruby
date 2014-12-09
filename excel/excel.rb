# excel.rb ---
#
# Filename: excel.rb
# Description:
# Author:
# Maintainer:
# Created: Tue Dec  2 09:38:43 2014 (+0800)
# Version:
# Package-Requires: ()
# Last-Updated: Tue Dec  2 13:49:18 2014 (+0800)
#           By: vagrant
#     Update #: 198
# URL:
# Doc URL:
# Keywords:
# Compatibility:
#
#

# Commentary:
#
#
#
#

# Change Log:
#
#
#
#
# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or (at
# your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with GNU Emacs.  If not, see <http://www.gnu.org/licenses/>.
#
#

# Code:

require 'spreadsheet'

Spreadsheet.client_encoding = 'UTF-8'

$book = Spreadsheet::Workbook::new

def genSheet(name, file, filter=lambda{|x| return true;},format=nil)
  source = (Spreadsheet.open file).worksheets[0]
  sheet = $book.worksheet name
  sheet = sheet || ($book.create_worksheet :name=>name)
  index = sheet.rows.size
  source.each do |row|
    next if !filter.call(row)
    sheet.insert_row(index, row.to_a)
    (sheet.row(index).default_format = format )if format
    index = index + 1
  end
end

genSheet("Normal Sales", "./20141127/Stock_out.xls",
         lambda{|x| x.idx==0 || (!x[2] || !x[2].include?("VSC"))})
genSheet("VIP Sales", "./20141127/Stock_out.xls",
         lambda{|x| x.idx==0 ||(x[2] && x[2].include?("VSC"))})

genSheet("Stock in & Pier out", "./20141127/Stock_in_pier_out.xls")

genSheet("Normal Sales", "./20141127/return.xls",
         lambda{|x| x.idx!=0 && (!x[2] || !x[2].include?("VSC"))},
         (Spreadsheet::Format.new :color=> :red))
genSheet("VIP Sales", "./20141127/return.xls",
         lambda{|x| x.idx!=0 && (x[2] && x[2].include?("VSC"))},
         (Spreadsheet::Format.new :color=> :red))
$book.write './test.xls'

#
# excel.rb ends here
