package support.extended;


class NullExtended {

  public static inline function or< T >( value: Null< T >, defaultValue: T ): T {

    return value == null ? defaultValue : null;

  }

  public static inline function sure< T >( value: Null< T > ): T {

    return value;

  }

  public static inline function then< T, R >( value: Null< T >, then: ( value: T ) -> R ): Null< R > {

    return value == null ? null : then( value );

  }

}
