
(function ($) {
    'use strict';

    $.extend($.fn.bootstrapTable.defaults, {
        fixedColumns: true,
        fixedNumber: 1,
        fixedPos:'right'//默认right可选择left
    });

    var BootstrapTable = $.fn.bootstrapTable.Constructor,
        _initHeader = BootstrapTable.prototype.initHeader,
        _initBody = BootstrapTable.prototype.initBody,
        _resetView = BootstrapTable.prototype.resetView;

    BootstrapTable.prototype.initFixedColumns = function () {
        this.$fixedBody = $([
            '<div class="fixed-table-column">',
            '<table>',
            '<thead></thead>',
            '<tbody></tbody>',
            '</table>',
            '</div>'].join(''));

        this.timeoutHeaderColumns_ = 0;
        this.timeoutBodyColumns_ = 0;
        this.$fixedBody.find('table').attr('class', this.$el.attr('class'));
        this.$fixedHeaderColumns = this.$fixedBody.find('thead');
        this.$fixedBodyColumns = this.$fixedBody.find('tbody');
        this.$tableBody.before(this.$fixedBody);
    };

    BootstrapTable.prototype.initHeader = function () {
        _initHeader.apply(this, Array.prototype.slice.apply(arguments));

        if (!this.options.fixedColumns) {
            return;
        }

        this.initFixedColumns();

        var $tr = this.$header.find('tr:eq(0)').clone(),
            $ths = $tr.clone().find('th');

        $tr.html('');
        if(this.options.fixedPos=='left'){
            this.$fixedBody.css("left",'0');
            for (var i = 0; i < this.options.fixedNumber; i++) {
                $tr.append($ths.eq(i).clone(true));
            }

            //隐藏原有表头
            //this.$header.find('tr').find('td:lt('+(this.options.fixedNumber)+')').html('&nbsp;');
        }else{
            this.$fixedBody.css("right",'0');
            var colLen = this.options.columns[0].length;
            for (var i = colLen;
                 colLen - i < this.options.fixedNumber; i--) {
                $tr.append($ths.eq(i-1).clone(true));
            }
            //隐藏原有表头
            //this.$header.find('tr').find('td:gt('+(colLen-this.options.fixedNumber-1)+')').html('&nbsp;');
        }

        this.$fixedHeaderColumns.html('').append($tr);
    };

    BootstrapTable.prototype.initBody = function () {
        _initBody.apply(this, Array.prototype.slice.apply(arguments));

        if (!this.options.fixedColumns) {
            return;
        }

        var that = this;

        this.$fixedBodyColumns.html('');
        var col_index = 0;
        this.$body.find('> tr[data-index]').each(function () {
            var $tr = $(this).clone(),
                $tds = $tr.clone().find('td');

            $tr.html('');
            //for (var i = 0; i < that.options.fixedNumber; i++) {
            //    $tr.append($tds.eq(i).clone());
            //}


            if(that.options.fixedPos=='left'){
                for (var i = 0; i < that.options.fixedNumber; i++) {
                    $tr.append($tds.eq(i).clone(true));
                    $tds.eq(i).hide();
                }
                //隐藏原有body
                //that.$tableBody.find('tr').find('td:le('+(that.options.fixedNumber)+')').html('&nbsp;');
            }else{
                var colLen = that.options.columns[0].length;
                for (var i = colLen;
                     colLen - i < that.options.fixedNumber; i--) {
                    $tr.append($tds.eq(i-1).clone(true));
                }
                //隐藏原有body
                //that.$tableBody.find('tr').find('td:gt('+(colLen-that.options.fixedNumber-1)+')').html('&nbsp;');
            }


            that.$fixedBodyColumns.append($tr);
        });
    };

    BootstrapTable.prototype.resetView = function () {
        _resetView.apply(this, Array.prototype.slice.apply(arguments));

        if (!this.options.fixedColumns) {
            return;
        }

        clearTimeout(this.timeoutHeaderColumns_);
        this.timeoutHeaderColumns_ = setTimeout($.proxy(this.fitHeaderColumns, this), this.$el.is(':hidden') ? 100 : 0);

        clearTimeout(this.timeoutBodyColumns_);
        this.timeoutBodyColumns_ = setTimeout($.proxy(this.fitBodyColumns, this), this.$el.is(':hidden') ? 100 : 0);
    };

    BootstrapTable.prototype.fitHeaderColumns = function () {
        var that = this,
            visibleFields = this.getVisibleFields(),
            headerWidth = 0;

        this.$body.find('tr:first-child:not(.no-records-found) > *').each(function (i) {
            var $this = $(this),
                index = i;

            if (i >= that.options.fixedNumber) {
                return false;
            }

            if (that.options.detailView && !that.options.cardView) {
                index = i - 1;
            }
            if(that.options.fixedPos == 'right'){
                var $widthEl =  that.$body.find('tr:first-child:not(.no-records-found) > *:eq('+([that.options.columns[0].length-index-1])+')');

                that.$fixedBody.find('thead th[data-field="' + visibleFields[that.options.columns[0].length-index-1] + '"]')
                    .find('.fht-cell').width($widthEl.innerWidth() - 1);

                headerWidth += $widthEl.outerWidth();
            }else{
                that.$fixedBody.find('thead th[data-field="' + visibleFields[index] + '"]')
                    .find('.fht-cell').width($this.innerWidth() - 1);
                headerWidth += $this.outerWidth();
            }

            //debugger;
        });
        this.$fixedBody.width(headerWidth).show();
        //this.$fixedBody.show();
    };

    BootstrapTable.prototype.fitBodyColumns = function () {
        var that = this,
            top = -(parseInt(this.$el.css('margin-top')) - 2),
            height = this.$tableBody.height() - 2;

        if (!this.$body.find('> tr[data-index]').length) {
            this.$fixedBody.hide();
            return;
        }

        /*this.$body.find('> tr').each(function (i) {
            that.$fixedBody.find('tbody tr:eq(' + i + ')').height($(this).height() - 1);
        });
*/
        //// events
        this.$tableBody.off('scroll').on('scroll', function () {
            that.$fixedBody.find('table').css('top', -$(this).scrollTop());
        });

        $(window).off('resize').on('resize',function () {
           // debugger;
            that.fitHeaderColumns();
        });

        this.$body.find('> tr[data-index]').off('hover').hover(function () {
            var index = $(this).data('index');
            that.$fixedBody.find('tr[data-index="' + index + '"]').addClass('hover');
        }, function () {
            var index = $(this).data('index');
            that.$fixedBody.find('tr[data-index="' + index + '"]').removeClass('hover');
        });
        this.$fixedBody.find('tr[data-index]').off('hover').hover(function () {
            var index = $(this).data('index');
            that.$body.find('tr[data-index="' + index + '"]').addClass('hover');
        }, function () {
            var index = $(this).data('index');
            that.$body.find('> tr[data-index="' + index + '"]').removeClass('hover');
        });
    };

})(jQuery);