class Adapter
  class LearnApi
    class Client
      LEARN_API_BASE_URL = 'http://learn.co/api'
      attr_reader :oauth_token

      def initialize(token:)
        @oauth_token = token
      end

      def students_for_batch(batch_id)
         RestClient.get("#{LEARN_API_BASE_URL}/batches/#{batch_id}/users", headers: request_header) 
      end

      def request_header
        {"Authorization": "Bearer #{oauth_token}"}
      end

    end
  end
end
