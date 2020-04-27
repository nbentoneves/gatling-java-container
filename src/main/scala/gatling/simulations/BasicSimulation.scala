package gatling.simulations

import java.util.concurrent.TimeUnit

import io.gatling.core.Predef._
import io.gatling.core.structure.ScenarioBuilder
import io.gatling.http.Predef._
import io.gatling.http.protocol.HttpProtocolBuilder

import scala.concurrent.duration.FiniteDuration

class BasicSimulation extends Simulation {

  val httpProtocol: HttpProtocolBuilder = http
    .baseUrl("http://sapo.pt")

  val scn: ScenarioBuilder = scenario("Testing Sapo")
    .exec(
      http("Request Sapo")
        .get("/")
    )

  setUp(
    scn.inject(
      nothingFor(FiniteDuration.apply(5, TimeUnit.SECONDS)),
      atOnceUsers(1)
    ).protocols(httpProtocol)
  )

}
