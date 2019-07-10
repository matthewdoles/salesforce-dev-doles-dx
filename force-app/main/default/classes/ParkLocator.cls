public class ParkLocator {
    public static String[] country(String country) {
        ParkService.ParksImplPort parks = new ParkService.ParksImplPort();
        String [] parknames = parks.byCountry(country);
        return parknames;
    }
}