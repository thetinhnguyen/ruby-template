import * as moment from 'moment';
import { DateFormat } from '../consts/date-format.const';
import { DayOfWeek } from '../consts/day-of-week.const';

export class MomentHelper {
    static formatDate(date, format = DateFormat.DateFormat) {
        return moment(date).format(format);
    }

    static parseToJsonString(date) {
        return moment(date).format(DateFormat.DateFormatJson);
    }

    static parseToMoment(date, format = '') {
        if (format !== '') {
            return moment(moment(date).format(format));
        }
        return moment(date);
    }

    static equalDate(date, dateCheck = moment()) {
        return moment(date).isSame(moment(dateCheck), 'days');
    }

    static equalGreaterDate(date, dateCheck = moment()) {
        return moment(date).isSameOrAfter(moment(dateCheck), 'days');
    }

    static equalLessDate(date, dateCheck = moment()) {
        return moment(date).isSameOrBefore(moment(dateCheck), 'days');
    }

    static lessDate(date, dateCheck = moment()) {
        return moment(date).isBefore(moment(dateCheck), 'days');
    }

    static greaterDate(date, dateCheck = moment()) {
        return moment(date).isAfter(moment(dateCheck), 'days');
    }

    static dayOfWeek(day) {
        return moment().day(day).format(DateFormat.DayOfWeek);
    }

    static currentDate(format = DateFormat.DateFormatJson) {
        return moment(moment().format(format));
    }

    static addDay(date, duration) {
        return moment(date).add(duration, 'days');
    }

    static subtractDay(date, duration) {
        return moment(date).subtract(duration, 'days');
    }

    static diffTwoDays(date1, date2) {
        return moment(date1).diff(moment(date2), 'days');
    }

    static addMonth(date, duration) {
        return moment(date).add(duration, 'months');
    }

    static addYear(date, duration) {
        return moment(date).add(duration, 'years');
    }

    static startDateOfYear(date = moment()) {
        return moment(date).startOf('year');
    }

    static endDateOfYear(date = moment()) {
        return moment(date).endOf('year');
    }

    static equalYear(date, dateCheck = moment()) {
        return moment(date).isSame(moment(dateCheck), 'years');
    }

    static equalGreaterYear(date, dateCheck = moment()) {
        return moment(date).isSameOrAfter(moment(dateCheck), 'years');
    }

    static equalLessYear(date, dateCheck = moment()) {
        return moment(date).isSameOrBefore(moment(dateCheck), 'years');
    }

    static lessYear(date, dateCheck = moment()) {
        return moment(date).isBefore(moment(dateCheck), 'years');
    }

    static greaterYear(date, dateCheck = moment()) {
        return moment(date).isAfter(moment(dateCheck), 'years');
    }

    static durationDay(date, dateCheck = moment()) {
        return moment(date).diff(moment(dateCheck), 'days');
    }

    static isSunday(date) {
        return moment(date).day() === DayOfWeek.Sun;
    }

    static isMonday(date) {
        return moment(date).day() === DayOfWeek.Mon;
    }

    static isTueday(date) {
        return moment(date).day() === DayOfWeek.Tue;
    }

    static isWednerday(date) {
        return moment(date).day() === DayOfWeek.Wed;
    }

    static isThurday(date) {
        return moment(date).day() === DayOfWeek.Thu;
    }

    static isFriday(date) {
        return moment(date).day() === DayOfWeek.Fri;
    }

    static isSaterday(date) {
        return moment(date).day() === DayOfWeek.Sat;
    }

    static startDateOfMonth(date = moment()) {
        return moment(date).startOf('month');
    }

    static startOfMonth(month, year) {
        return moment().month(month).year(year).startOf('month');
    }

    static endDateOfMonth(date = moment()) {
        return moment(date).endOf('month');
    }

    static getDay(date = moment()) {
        return moment(date).date();
    }

    static getMonth(date = moment()) {
        return moment(date).month();
    }

    static getYear(date = moment()) {
        return moment(date).year();
    }

    static getDayOfWeekShort(date = moment()) {
        return moment(date).format('ddd');
    }

    static getDayOfWeekFull(date = moment()) {
        return moment(date).format('dddd');
    }

    static setDate(date, month, year) {
        return moment(moment().date(date).month(month).year(year).format(DateFormat.DateFormatJson));
    }

    static parseDateToString(date = moment(), outputWhenInvalid = '-', format = DateFormat.DateFormat) {
        if (moment(date).isValid() && date !== DateFormat.MinDateJson) {
            return moment(date).format(format);
        }
        return outputWhenInvalid;
    }
}
