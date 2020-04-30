package support.extended;


class LambdaExtended {

  public static inline function iterable< T >( iterator: Iterator< T > ): Iterable< T > {

    return { iterator: () -> iterator };

  }

}
